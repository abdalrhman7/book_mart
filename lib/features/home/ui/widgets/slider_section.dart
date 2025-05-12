import 'package:book_mart/core/widgets/shimmer/shimmer_effect.dart';
import 'package:book_mart/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_slider.dart';

class ImageSliderBlocBuilder extends StatefulWidget {
  const ImageSliderBlocBuilder({super.key});

  @override
  State<ImageSliderBlocBuilder> createState() => _ImageSliderBlocBuilderState();
}

class _ImageSliderBlocBuilderState extends State<ImageSliderBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is GetSliderImageLoading ||
            current is GetSliderImageSuccess ||
            current is GetSliderImageFailure,
        builder: (context, state) {
          if (state is GetSliderImageLoading) {
            return ShimmerEffect(
              width: double.infinity,
              height: 180.h,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            );
          } else if (state is GetSliderImageSuccess) {
            return ImageSlider(
              images: state.sliderImagesData.images,
            );
          } else if (state is GetSliderImageFailure) {
            return Text(state.apiErrorModel.getAllErrorsMessages());
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}


