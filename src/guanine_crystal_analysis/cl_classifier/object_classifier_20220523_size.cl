/*
OpenCL RandomForestClassifier
classifier_class_name = TableRowClassifier
feature_specification = area
num_ground_truth_dimensions = 1
num_classes = 2
num_features = 1
max_depth = 2
num_trees = 10
apoc_version = 0.8.0
*/
__kernel void predict (IMAGE_in0_TYPE in0, IMAGE_out_TYPE out) {
 sampler_t sampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP_TO_EDGE | CLK_FILTER_NEAREST;
 const int x = get_global_id(0);
 const int y = get_global_id(1);
 const int z = get_global_id(2);
 float i0 = READ_IMAGE(in0, sampler, POS_in0_INSTANCE(x,y,z,0)).x;
 float s0=0;
 float s1=0;
if(i0<327.5){
 if(i0<95.0){
  s0+=13.0;
 } else {
  s0+=17.0;
  s1+=4.0;
 }
} else {
 if(i0<1939.0){
  s0+=22.0;
  s1+=24.0;
 } else {
  s0+=19.0;
  s1+=2.0;
 }
}
if(i0<327.5){
 if(i0<95.0){
  s0+=6.0;
 } else {
  s0+=17.0;
  s1+=5.0;
 }
} else {
 if(i0<2742.5){
  s0+=30.0;
  s1+=34.0;
 } else {
  s0+=9.0;
 }
}
if(i0<227.5){
 if(i0<95.5){
  s0+=8.0;
 } else {
  s0+=17.0;
  s1+=3.0;
 }
} else {
 if(i0<2930.0){
  s0+=32.0;
  s1+=36.0;
 } else {
  s0+=5.0;
 }
}
if(i0<96.5){
 s0+=14.0;
} else {
 if(i0<2266.5){
  s0+=41.0;
  s1+=32.0;
 } else {
  s0+=13.0;
  s1+=1.0;
 }
}
if(i0<169.0){
 if(i0<103.0){
  s0+=6.0;
  s1+=1.0;
 } else {
  s0+=9.0;
 }
} else {
 if(i0<256.0){
  s0+=2.0;
  s1+=9.0;
 } else {
  s0+=49.0;
  s1+=25.0;
 }
}
if(i0<2266.5){
 if(i0<327.5){
  s0+=29.0;
  s1+=5.0;
 } else {
  s0+=19.0;
  s1+=26.0;
 }
} else {
 if(i0<2930.0){
  s0+=10.0;
  s1+=1.0;
 } else {
  s0+=11.0;
 }
}
if(i0<140.0){
 if(i0<96.5){
  s0+=15.0;
 } else {
  s0+=8.0;
  s1+=1.0;
 }
} else {
 if(i0<2266.5){
  s0+=32.0;
  s1+=24.0;
 } else {
  s0+=18.0;
  s1+=3.0;
 }
}
if(i0<2316.5){
 if(i0<2165.0){
  s0+=46.0;
  s1+=28.0;
 } else {
  s1+=5.0;
 }
} else {
 if(i0<2890.0){
  s0+=9.0;
  s1+=2.0;
 } else {
  s0+=11.0;
 }
}
if(i0<2266.5){
 if(i0<96.5){
  s0+=11.0;
 } else {
  s0+=37.0;
  s1+=37.0;
 }
} else {
 if(i0<2742.5){
  s0+=5.0;
  s1+=1.0;
 } else {
  s0+=10.0;
 }
}
if(i0<327.5){
 if(i0<96.5){
  s0+=10.0;
 } else {
  s0+=22.0;
  s1+=6.0;
 }
} else {
 if(i0<2266.5){
  s0+=12.0;
  s1+=36.0;
 } else {
  s0+=12.0;
  s1+=3.0;
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
