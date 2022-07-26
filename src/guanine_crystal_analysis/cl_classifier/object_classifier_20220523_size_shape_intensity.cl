/*
OpenCL RandomForestClassifier
classifier_class_name = TableRowClassifier
feature_specification = aspect_ratio max_intensity min_intensity perimeter_skimage area mean_intensity major_axis_length minor_axis_length circularity solidity eccentricity roundness_skimage median sum variance perimeter_on_border perimeter_on_border_ratio
num_ground_truth_dimensions = 1
num_classes = 2
num_features = 17
max_depth = 2
num_trees = 10
apoc_version = 0.8.0
*/
__kernel void predict (IMAGE_in0_TYPE in0, IMAGE_in1_TYPE in1, IMAGE_in2_TYPE in2, IMAGE_in3_TYPE in3, IMAGE_in4_TYPE in4, IMAGE_in5_TYPE in5, IMAGE_in6_TYPE in6, IMAGE_in7_TYPE in7, IMAGE_in8_TYPE in8, IMAGE_in9_TYPE in9, IMAGE_in10_TYPE in10, IMAGE_in11_TYPE in11, IMAGE_in12_TYPE in12, IMAGE_in13_TYPE in13, IMAGE_in14_TYPE in14, IMAGE_in15_TYPE in15, IMAGE_in16_TYPE in16, IMAGE_out_TYPE out) {
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
 float i16 = READ_IMAGE(in16, sampler, POS_in16_INSTANCE(x,y,z,0)).x;
 float s0=0;
 float s1=0;
if(i8<0.510736346244812){
 if(i7<22.727909088134766){
  s0+=12.0;
  s1+=3.0;
 } else {
  s0+=33.0;
 }
} else {
 if(i12<1.020393967628479){
  s0+=24.0;
  s1+=4.0;
 } else {
  s0+=2.0;
  s1+=23.0;
 }
}
if(i3<302.1878662109375){
 if(i1<2.3606557846069336){
  s0+=32.0;
  s1+=3.0;
 } else {
  s0+=15.0;
  s1+=36.0;
 }
} else {
 s0+=15.0;
}
if(i8<0.510736346244812){
 if(i5<1.164980173110962){
  s0+=16.0;
 } else {
  s0+=30.0;
  s1+=9.0;
 }
} else {
 if(i6<22.041126251220703){
  s0+=14.0;
  s1+=2.0;
 } else {
  s0+=2.0;
  s1+=28.0;
 }
}
if(i12<2.673387050628662){
 if(i3<201.32337951660156){
  s0+=35.0;
  s1+=26.0;
 } else {
  s0+=33.0;
 }
} else {
 s1+=7.0;
}
if(i6<64.16293334960938){
 if(i9<0.8712285757064819){
  s0+=32.0;
  s1+=2.0;
 } else {
  s0+=8.0;
  s1+=29.0;
 }
} else {
 if(i9<0.8102699518203735){
  s0+=23.0;
 } else {
  s0+=3.0;
  s1+=4.0;
 }
}
if(i10<0.5268921852111816){
 s1+=10.0;
} else {
 if(i12<2.7677409648895264){
  s0+=69.0;
  s1+=17.0;
 } else {
  s1+=5.0;
 }
}
if(i7<10.407154083251953){
 if(i14<0.10552239418029785){
  s0+=16.0;
 } else {
  s0+=5.0;
  s1+=1.0;
 }
} else {
 if(i8<0.510764479637146){
  s0+=40.0;
  s1+=4.0;
 } else {
  s0+=12.0;
  s1+=23.0;
 }
}
if(i5<1.0034186840057373){
 if(i9<0.8839756846427917){
  s0+=19.0;
 } else {
  s0+=4.0;
  s1+=1.0;
 }
} else {
 if(i14<0.17637592554092407){
  s0+=2.0;
  s1+=12.0;
 } else {
  s0+=41.0;
  s1+=22.0;
 }
}
if(i9<0.8618302345275879){
 if(i10<0.9798356294631958){
  s0+=51.0;
  s1+=3.0;
 } else {
  s1+=5.0;
 }
} else {
 if(i12<0.9633152484893799){
  s0+=7.0;
 } else {
  s0+=5.0;
  s1+=30.0;
 }
}
if(i12<0.9676697254180908){
 if(i8<0.8782422542572021){
  s0+=27.0;
 } else {
  s0+=1.0;
  s1+=1.0;
 }
} else {
 if(i9<0.7981323003768921){
  s0+=20.0;
  s1+=2.0;
 } else {
  s0+=8.0;
  s1+=42.0;
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
