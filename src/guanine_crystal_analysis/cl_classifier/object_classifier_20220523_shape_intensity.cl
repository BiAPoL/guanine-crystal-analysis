/*
OpenCL RandomForestClassifier
classifier_class_name = TableRowClassifier
feature_specification = aspect_ratio perimeter_skimage major_axis_length minor_axis_length circularity solidity eccentricity roundness_skimage perimeter_on_border perimeter_on_border_ratio max_intensity mean_intensity min_intensity median sum variance
num_ground_truth_dimensions = 1
num_classes = 2
num_features = 16
max_depth = 2
num_trees = 10
apoc_version = 0.8.0
*/
__kernel void predict (IMAGE_in0_TYPE in0, IMAGE_in1_TYPE in1, IMAGE_in2_TYPE in2, IMAGE_in3_TYPE in3, IMAGE_in4_TYPE in4, IMAGE_in5_TYPE in5, IMAGE_in6_TYPE in6, IMAGE_in7_TYPE in7, IMAGE_in8_TYPE in8, IMAGE_in9_TYPE in9, IMAGE_in10_TYPE in10, IMAGE_in11_TYPE in11, IMAGE_in12_TYPE in12, IMAGE_in13_TYPE in13, IMAGE_in14_TYPE in14, IMAGE_in15_TYPE in15, IMAGE_out_TYPE out) {
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
 float i11 = READ_IMAGE(in11, sampler, POS_in11_INSTANCE(x,y,z,0)).x;
 float i12 = READ_IMAGE(in12, sampler, POS_in12_INSTANCE(x,y,z,0)).x;
 float i13 = READ_IMAGE(in13, sampler, POS_in13_INSTANCE(x,y,z,0)).x;
 float i14 = READ_IMAGE(in14, sampler, POS_in14_INSTANCE(x,y,z,0)).x;
 float i15 = READ_IMAGE(in15, sampler, POS_in15_INSTANCE(x,y,z,0)).x;
 float s0=0;
 float s1=0;
if(i4<0.510736346244812){
 if(i1<198.87057495117188){
  s0+=16.0;
  s1+=3.0;
 } else {
  s0+=29.0;
 }
} else {
 if(i2<34.20429229736328){
  s0+=26.0;
  s1+=5.0;
 } else {
  s1+=22.0;
 }
}
if(i11<1.172239899635315){
 if(i7<0.7240169048309326){
  s0+=37.0;
  s1+=3.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i4<0.36156368255615234){
  s0+=18.0;
  s1+=2.0;
 } else {
  s0+=7.0;
  s1+=33.0;
 }
}
if(i13<2.205306053161621){
 if(i5<0.8603421449661255){
  s0+=53.0;
  s1+=3.0;
 } else {
  s0+=8.0;
  s1+=20.0;
 }
} else {
 if(i13<2.673387050628662){
  s0+=1.0;
  s1+=5.0;
 } else {
  s1+=11.0;
 }
}
if(i13<2.673387050628662){
 if(i1<201.32337951660156){
  s0+=35.0;
  s1+=26.0;
 } else {
  s0+=33.0;
 }
} else {
 s1+=7.0;
}
if(i0<1.1441482305526733){
 s1+=7.0;
} else {
 if(i13<2.7677409648895264){
  s0+=66.0;
  s1+=23.0;
 } else {
  s1+=5.0;
 }
}
if(i4<0.510736346244812){
 if(i0<3.756357192993164){
  s0+=43.0;
 } else {
  s0+=6.0;
  s1+=2.0;
 }
} else {
 if(i11<1.1116571426391602){
  s0+=20.0;
  s1+=4.0;
 } else {
  s1+=26.0;
 }
}
if(i7<0.8323825597763062){
 if(i4<0.4558182954788208){
  s0+=40.0;
  s1+=2.0;
 } else {
  s0+=33.0;
  s1+=22.0;
 }
} else {
 s1+=4.0;
}
if(i10<1.8856022357940674){
 s0+=17.0;
} else {
 if(i1<206.06600952148438){
  s0+=20.0;
  s1+=33.0;
 } else {
  s0+=29.0;
  s1+=2.0;
 }
}
if(i7<0.6855721473693848){
 if(i6<0.9020066261291504){
  s0+=46.0;
  s1+=4.0;
 } else {
  s0+=16.0;
  s1+=24.0;
 }
} else {
 if(i5<0.8666001558303833){
  s0+=1.0;
 } else {
  s1+=10.0;
 }
}
if(i5<0.8618302345275879){
 if(i6<0.9811142683029175){
  s0+=46.0;
  s1+=4.0;
 } else {
  s1+=5.0;
 }
} else {
 if(i10<2.0834782123565674){
  s0+=9.0;
  s1+=1.0;
 } else {
  s0+=1.0;
  s1+=35.0;
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
