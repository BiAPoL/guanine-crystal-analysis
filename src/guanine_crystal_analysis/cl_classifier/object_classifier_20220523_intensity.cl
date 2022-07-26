/*
OpenCL RandomForestClassifier
classifier_class_name = TableRowClassifier
feature_specification = max_intensity mean_intensity min_intensity median sum variance
num_ground_truth_dimensions = 1
num_classes = 2
num_features = 6
max_depth = 2
num_trees = 10
apoc_version = 0.8.0
*/
__kernel void predict (IMAGE_in0_TYPE in0, IMAGE_in1_TYPE in1, IMAGE_in2_TYPE in2, IMAGE_in3_TYPE in3, IMAGE_in4_TYPE in4, IMAGE_in5_TYPE in5, IMAGE_out_TYPE out) {
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
 float s0=0;
 float s1=0;
if(i0<1.827868938446045){
 s0+=25.0;
} else {
 if(i4<3159.510009765625){
  s0+=24.0;
  s1+=28.0;
 } else {
  s0+=22.0;
  s1+=2.0;
 }
}
if(i3<0.959505021572113){
 if(i2<0.41803279519081116){
  s0+=25.0;
 } else {
  s0+=3.0;
  s1+=2.0;
 }
} else {
 if(i4<2760.884765625){
  s0+=13.0;
  s1+=28.0;
 } else {
  s0+=21.0;
  s1+=9.0;
 }
}
if(i3<2.205306053161621){
 if(i1<1.728459358215332){
  s0+=38.0;
  s1+=21.0;
 } else {
  s0+=23.0;
  s1+=2.0;
 }
} else {
 if(i1<4.788457870483398){
  s1+=16.0;
 } else {
  s0+=1.0;
 }
}
if(i3<2.673387050628662){
 if(i4<3262.62939453125){
  s0+=50.0;
  s1+=26.0;
 } else {
  s0+=18.0;
 }
} else {
 s1+=7.0;
}
if(i3<2.673387050628662){
 if(i4<3258.214599609375){
  s0+=46.0;
  s1+=26.0;
 } else {
  s0+=20.0;
  s1+=1.0;
 }
} else {
 s1+=8.0;
}
if(i1<0.9806220531463623){
 if(i4<271.11474609375){
  s0+=23.0;
 } else {
  s0+=3.0;
  s1+=1.0;
 }
} else {
 if(i3<2.673387050628662){
  s0+=43.0;
  s1+=21.0;
 } else {
  s1+=10.0;
 }
}
if(i5<0.11518747359514236){
 if(i4<185.0370635986328){
  s0+=21.0;
 } else {
  s0+=7.0;
  s1+=4.0;
 }
} else {
 if(i0<3.4861111640930176){
  s0+=8.0;
  s1+=11.0;
 } else {
  s0+=37.0;
  s1+=13.0;
 }
}
if(i3<2.2412109375){
 if(i3<0.9633152484893799){
  s0+=21.0;
  s1+=1.0;
 } else {
  s0+=45.0;
  s1+=26.0;
 }
} else {
 s1+=8.0;
}
if(i1<1.0034186840057373){
 if(i1<0.9806220531463623){
  s0+=22.0;
 } else {
  s0+=3.0;
  s1+=1.0;
 }
} else {
 if(i5<0.42960822582244873){
  s0+=9.0;
  s1+=23.0;
 } else {
  s0+=29.0;
  s1+=14.0;
 }
}
if(i0<1.9183892011642456){
 s0+=23.0;
} else {
 if(i2<0.18333333730697632){
  s0+=27.0;
  s1+=16.0;
 } else {
  s0+=6.0;
  s1+=29.0;
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
