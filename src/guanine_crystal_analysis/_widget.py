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


    
    
    
