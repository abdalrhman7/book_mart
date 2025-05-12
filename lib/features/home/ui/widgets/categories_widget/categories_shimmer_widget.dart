import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ShimmerBookCategories extends StatelessWidget {
  const ShimmerBookCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
            (index) =>
            Padding(
              padding: EdgeInsetsDirectional.only(end: 10.w),
              child: Column(
                children: [
                  const ShimmerEffect(
                    width: 70,
                    height: 70,
                    shape: CircleBorder(),
                  ),
                  verticalSpace(4),
                  ShimmerEffect(
                    width: 40.w,
                    height: 12.h,
                    shape: const RoundedRectangleBorder(),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}