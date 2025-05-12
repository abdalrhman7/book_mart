import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) {
  return SizedBox(height: height.h );
}

SizedBox horizontalSpace(double width) {
  return SizedBox(width: width.w);
}

SliverToBoxAdapter sliverVerticalSpace(double height) {
  return SliverToBoxAdapter(child: verticalSpace(height));
}

SliverToBoxAdapter sliverHorizontalSpace(double width) {
  return SliverToBoxAdapter(child: horizontalSpace(width));
}