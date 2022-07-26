"""
This module is an example of a barebones QWidget plugin for napari

It implements the Widget specification.
see: https://napari.org/plugins/guides.html?#widgets

Replace code below according to your needs.
"""

# Uses the `autogenerate: true` flag in the plugin manifest
# to indicate it should be wrapped as a magicgui to autogenerate
# a widget.
def normalization(input_image: "napari.types.ImageData")->"napari.types.ImageData":
    import numpy as np
    
    normalized_image = input_image/np.percentile(input_image,99)
    return normalized_image

def segmentation(normalized_image: "napari.types.ImageData", 
                 segmenter: str="object_segmenter_20220523_sorted.cl",
                 minimum_pixel_count:int=50)->"napari.types.LabelsData":
    from pathlib import Path
    import apoc
    import pyclesperanto_prototype as cle
    
    segmenter_filename = Path(__file__).parent/"cl_segmenter"/segmenter
    print(segmenter_filename)
    
    segmenter = apoc.ObjectSegmenter(opencl_filename=segmenter_filename)
     #show result of object segmenter
    labels = segmenter.predict(normalized_image)
    
    #show result of object segmenter with labels in range
    labels_in_range = cle.exclude_small_labels(source = labels, maximum_size = minimum_pixel_count)
    return labels_in_range

def analyze_image(image: "napari.types.ImageData", 
                  label: "napari.types.LabelsData", 
                  napari_viewer: "napari.Viewer" = None) -> "pandas.DataFrame":

    import pandas as pd
    from napari_skimage_regionprops import regionprops_table
    from napari_simpleitk_image_processing import label_statistics

    # measure in normalized image
    df_skimage = pd.DataFrame(regionprops_table(image , label, size = True, intensity = True, perimeter = True, shape = True))
    df_skimage["aspect_ratio"] = df_skimage["major_axis_length"]/df_skimage["minor_axis_length"]
    df_simpleitk = pd.DataFrame(label_statistics(image, label, size = True, intensity = True, perimeter = True, shape = True))
    results = pd.merge(df_skimage, df_simpleitk, on = "label", suffixes = ('_skimage', '_simpleitk'))
    to_drop = ["extent", "local_centroid-0", "local_centroid-1","orientation"]
    results = results.drop(to_drop, axis=1)
    
    #visualize table in napari
    if napari_viewer is not None:
        from napari_workflows._workflow import _get_layer_from_data
        labels_layer = _get_layer_from_data(napari_viewer, label)
        # Store results in the properties dictionary:
        labels_layer.properties = results

        # turn table into a widget
        from napari_skimage_regionprops import add_table
        add_table(labels_layer, napari_viewer)
    else:
        import pandas
        return pandas.DataFrame(results)

def classify_objects(label: "napari.types.LabelsData",
                    intensity: bool = False,
                     shape: bool = True, 
                     size: bool = True,
                    classifier_filename:str = "object_classifier_20220523_",
                    napari_viewer: "napari.Viewer" = None)-> "napari.types.LabelsData":
    from napari_workflows._workflow import _get_layer_from_data
    import pandas as pd
    labels_layer = _get_layer_from_data(napari_viewer, label)
    table = pd.DataFrame(labels_layer.properties)
    print("alle keys:", table.keys())
    print(type(table))
    keep = table[['label', 'aspect_ratio', 'max_intensity', 'min_intensity', 'perimeter_skimage', 'area', 'mean_intensity', 'major_axis_length', 'minor_axis_length', 'circularity', 'solidity', 'eccentricity', 'roundness_skimage', 'median', 'sum', 'variance', 'perimeter_on_border','perimeter_on_border_ratio']]
    
    #intensity table
    df_intensity = keep[['label','max_intensity', 'mean_intensity', 'min_intensity','median', 'sum', 'variance']]
    
    #size table
    df_size = keep[['label','area']]
    
    #shape table
    df_shape = keep[['label', 'aspect_ratio','perimeter_skimage', 'major_axis_length',
       'minor_axis_length', 'circularity', 'solidity', 'eccentricity',
       'roundness_skimage', 'perimeter_on_border',
       'perimeter_on_border_ratio']]
    
    selected_table = None 
    
    if size:
        classifier_filename = classifier_filename + "size_"
        if selected_table is not None:
            selected_table = pd.merge(df_size, selected_table, on=('label'))
        else:
            selected_table = df_size
            
    if shape:
        classifier_filename = classifier_filename + "shape_"
        if selected_table is not None:
            selected_table = pd.merge(df_shape, selected_table, on=('label'))
        else:
            selected_table = df_shape

    if intensity:
        classifier_filename = classifier_filename + "intensity_"
        if selected_table is not None:
            selected_table = pd.merge(df_intensity, selected_table, on=('label'))
        else:
            selected_table = df_intensity
    
    classifier_filename = classifier_filename[:-1]+".cl"
    print("selected keys:", selected_table.keys())
    print(classifier_filename)
    return classifier(selected_table, label, classifier_filename)

def classifier(table, label, tabrowcl_filename):
    '''
    this function applies the classifier to the testing data.
    it creates:
    - an output image
    - writes the good crystal labels to a new table
    '''
    
    #import statements
    from pyclesperanto_prototype import imshow, replace_intensities
    import numpy as np
    import pandas as pd
    import apoc
    import os
    import pyclesperanto_prototype as cle
    from skimage.segmentation import relabel_sequential
    from pathlib import Path
    
    #prediction
    classifier_filename = Path(__file__).parent/"cl_classifier"/tabrowcl_filename
    print(classifier_filename)
    
    classifier = apoc.TableRowClassifier(opencl_filename= classifier_filename)
    prediction = classifier.predict(table)

    #append predicted classes as columns to the table
    table['predicted_class'] = prediction
    
    #add background to the prediction
    predicted_class_with_background = [0] + prediction.tolist()
    
    # connect prediction to label image
    class_image = replace_intensities(label, predicted_class_with_background).astype(int)
    return class_image


def bad_label_exclusion(label: "napari.types.LabelsData",
                        class_image: "napari.types.LabelsData")-> "napari.types.LabelsData":
    import os
    import numpy as np
    from pyclesperanto_prototype import relabel_sequential
    
    #change class of bad crystals (1) to background (0)
    class_image = np.asarray(class_image)
    class_image[class_image == 1]=0
    class_image_mask = class_image.astype(bool)
    
    #exclude bad labels from label image
    label_image_filtered=np.copy(label)
    label_image_filtered[class_image_mask==False]=0
    return relabel_sequential(label_image_filtered)

def analyze_deluxe(input_image: "napari.types.ImageData",
                   normalize: bool = True,
                   segmenter: str="object_segmenter_20220523_sorted.cl",
                   minimum_pixel_count:int=50,
                   intensity: bool = False,
                    shape: bool = True, 
                    size: bool = True,
                    classifier_filename:str = "object_classifier_20220523_",
                   napari_viewer: "napari.Viewer" = None):
    if normalize:
        image_maybe_normalized = normalization(input_image)
        napari_viewer.add_image(image_maybe_normalized,name="normalized")
    else:
        image_maybe_normalized = input_image
        
    segmentation_result = segmentation(image_maybe_normalized, segmenter, minimum_pixel_count)
    napari_viewer.add_labels(segmentation_result)
    
    analyze_image(image_maybe_normalized, segmentation_result, napari_viewer)
    classification_result = classify_objects(segmentation_result, intensity, shape, size, classifier_filename, napari_viewer)
    napari_viewer.add_labels(classification_result)
    
    exclusion_result = bad_label_exclusion(segmentation_result, classification_result)
    napari_viewer.add_labels(exclusion_result)
    
    analyze_image(image_maybe_normalized, exclusion_result, napari_viewer)
    
    
    

    
    
    
