/*
OpenCL RandomForestClassifier
classifier_class_name = TableRowClassifier
feature_specification = area aspect_ratio perimeter_skimage major_axis_length minor_axis_length circularity solidity eccentricity roundness_skimage perimeter_on_border perimeter_on_border_ratio
num_ground_truth_dimensions = 1
num_classes = 2
num_features = 11
max_depth = 2
num_trees = 10
apoc_version = 0.8.0
*/
__kernel void predict (IMAGE_in0_TYPE in0, IMAGE_in1_TYPE in1, IMAGE_in2_TYPE in2, IMAGE_in3_TYPE in3, IMAGE_in4_TYPE in4, IMAGE_in5_TYPE in5, IMAGE_in6_TYPE in6, IMAGE_in7_TYPE in7, IMAGE_in8_TYPE in8, IMAGE_in9_TYPE in9, IMAGE_in10_TYPE in10, IMAGE_out_TYPE out) {
 sampler_t sampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP_TO_EDGE | CLK_FILTER_NEAREST;
 const int x = get_global_id(0);
 const int y = get_global_id(1);
 const int z = get_global_id(2);
 float i0 = READ_IMAGE(in0, sampler, POS_in0_INSTANCE(x,y,z,0)).x;
 float i1 = READ_IMAGE(in1, sampler, POS_in1_INSTANCE(x,y,z,0)).x;
 float i2 = READ_IMAGE(in2, sampler, POS_in2_INSTANCE(x,y,z,0)).x;
 float i3 = READ_IMAGE(in3, sampler, POS_in3_INSTANCE(x,y,z,0)).x;
 float i4 = READ_IMAGE(in4, sampler, POS_in4_INSTANCE(x,y,z,0)).x;
 float i5 = READ_IMAGE(in5, sampler, POS_in5_INSTANCE(x,y,z,0)).x;
 float i6 = READ_IMAGE(in6, sampler, POS_in6_INSTANCE(x,y,z,0)).x;
 float i7 = READ_IMAGE(in7, sampler, POS_in7_INSTANCE(x,y,z,0)).x;
 float i8 = READ_IMAGE(in8, sampler, POS_in8_INSTANCE(x,y,z,0)).x;
 float i9 = READ_IMAGE(in9, sampler, POS_in9_INSTANCE(x,y,z,0)).x;
 float i10 = READ_IMAGE(in10, sampler, POS_in10_INSTANCE(x,y,z,0)).x;
 float s0=0;
 float s1=0;
if(i1<2.376129150390625){
 if(i6<0.930245041847229){
  s0+=54.0;
  s1+=4.0;
 } else {
  s1+=8.0;
 }
} else {
 if(i0<320.0){
  s0+=9.0;
  s1+=1.0;
 } else {
  s0+=8.0;
  s1+=17.0;
 }
}
if(i7<0.4857295751571655){
 s1+=7.0;
} else {
 if(i6<0.8618302345275879){
  s0+=52.0;
  s1+=5.0;
 } else {
  s0+=10.0;
  s1+=27.0;
 }
}
if(i6<0.8603421449661255){
 if(i1<5.352621078491211){
  s0+=54.0;
  s1+=3.0;
 } else {
  s1+=2.0;
 }
} else {
 if(i6<0.9080291390419006){
  s0+=8.0;
  s1+=15.0;
 } else {
  s1+=19.0;
 }
}
if(i6<0.8618302345275879){
 if(i1<2.873189926147461){
  s0+=46.0;
 } else {
  s0+=15.0;
  s1+=2.0;
 }
} else {
 if(i3<23.30257797241211){
  s0+=5.0;
  s1+=2.0;
 } else {
  s0+=2.0;
  s1+=29.0;
 }
}
if(i2<201.32337951660156){
 if(i5<0.510736346244812){
  s0+=21.0;
  s1+=3.0;
 } else {
  s0+=15.0;
  s1+=30.0;
 }
} else {
 if(i5<0.5932209491729736){
  s0+=30.0;
  s1+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i5<0.510736346244812){
 if(i5<0.4806461036205292){
  s0+=43.0;
 } else {
  s0+=6.0;
  s1+=2.0;
 }
} else {
 if(i4<11.460762023925781){
  s0+=17.0;
  s1+=2.0;
 } else {
  s0+=3.0;
  s1+=28.0;
 }
}
if(i8<0.8323825597763062){
 if(i1<2.870323896408081){
  s0+=62.0;
  s1+=12.0;
 } else {
  s0+=11.0;
  s1+=12.0;
 }
} else {
 s1+=4.0;
}
if(i6<0.8823349475860596){
 if(i5<0.8142498731613159){
  s0+=61.0;
  s1+=3.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<90.5){
  s0+=2.0;
 } else {
  s0+=3.0;
  s1+=31.0;
 }
}
if(i2<206.06600952148438){
 if(i5<0.3121909499168396){
  s0+=6.0;
 } else {
  s0+=25.0;
  s1+=37.0;
 }
} else {
 if(i6<0.8818113803863525){
  s0+=32.0;
 } else {
  s1+=1.0;
 }
}
if(i6<0.8618302345275879){
 if(i6<0.755998969078064){
  s0+=27.0;
 } else {
  s0+=19.0;
  s1+=9.0;
 }
} else {
 if(i4<11.863471984863281){
  s0+=8.0;
  s1+=4.0;
 } else {
  s0+=2.0;
  s1+=32.0;
 }
}
 float max_s=s0;
 int cls=1;
 if (max_s < s1) {
  max_s = s1;
  cls=2;
 }
 WRITE_IMAGE (out, POS_out_INSTANCE(x,y,z,0), cls);
}
