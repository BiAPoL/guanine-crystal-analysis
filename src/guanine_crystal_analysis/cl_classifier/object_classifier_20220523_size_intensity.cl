/*
OpenCL RandomForestClassifier
classifier_class_name = TableRowClassifier
feature_specification = area max_intensity mean_intensity min_intensity median sum variance
num_ground_truth_dimensions = 1
num_classes = 2
num_features = 7
max_depth = 2
num_trees = 10
apoc_version = 0.8.0
*/
__kernel void predict (IMAGE_in0_TYPE in0, IMAGE_in1_TYPE in1, IMAGE_in2_TYPE in2, IMAGE_in3_TYPE in3, IMAGE_in4_TYPE in4, IMAGE_in5_TYPE in5, IMAGE_in6_TYPE in6, IMAGE_out_TYPE out) {
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
 float s0=0;
 float s1=0;
if(i0<327.5){
 if(i4<0.9431756138801575){
  s0+=21.0;
 } else {
  s0+=9.0;
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
if(i2<1.172239899635315){
 if(i3<0.4229243993759155){
  s0+=34.0;
  s1+=2.0;
 } else {
  s0+=3.0;
  s1+=2.0;
 }
} else {
 if(i0<1192.5){
  s0+=2.0;
  s1+=24.0;
 } else {
  s0+=23.0;
  s1+=11.0;
 }
}
if(i6<0.1212172657251358){
 if(i6<0.04441478103399277){
  s0+=9.0;
 } else {
  s0+=15.0;
  s1+=6.0;
 }
} else {
 if(i1<8.722222328186035){
  s0+=25.0;
  s1+=30.0;
 } else {
  s0+=13.0;
  s1+=3.0;
 }
}
if(i4<2.673387050628662){
 if(i2<0.9375846982002258){
  s0+=23.0;
 } else {
  s0+=45.0;
  s1+=26.0;
 }
} else {
 s1+=7.0;
}
if(i0<169.0){
 if(i4<0.9633152484893799){
  s0+=12.0;
 } else {
  s0+=3.0;
  s1+=1.0;
 }
} else {
 if(i5<283.7622985839844){
  s0+=2.0;
  s1+=9.0;
 } else {
  s0+=49.0;
  s1+=25.0;
 }
}
if(i4<2.673387050628662){
 if(i5<2630.78466796875){
  s0+=40.0;
  s1+=22.0;
 } else {
  s0+=29.0;
 }
} else {
 s1+=10.0;
}
if(i1<2.0834782123565674){
 if(i5<185.0370635986328){
  s0+=21.0;
 } else {
  s0+=4.0;
  s1+=3.0;
 }
} else {
 if(i4<1.9689128398895264){
  s0+=48.0;
  s1+=16.0;
 } else {
  s1+=9.0;
 }
}
if(i0<2316.5){
 if(i4<1.1639138460159302){
  s0+=38.0;
  s1+=10.0;
 } else {
  s0+=8.0;
  s1+=23.0;
 }
} else {
 if(i2<3.7589492797851562){
  s0+=20.0;
 } else {
  s1+=2.0;
 }
}
if(i4<0.9633152484893799){
 s0+=24.0;
} else {
 if(i6<0.42960822582244873){
  s0+=10.0;
  s1+=24.0;
 } else {
  s0+=29.0;
  s1+=14.0;
 }
}
if(i2<0.9806220531463623){
 s0+=25.0;
} else {
 if(i1<6.766666412353516){
  s0+=16.0;
  s1+=40.0;
 } else {
  s0+=15.0;
  s1+=5.0;
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
