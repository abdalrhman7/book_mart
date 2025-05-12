import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/widgets/shimmer/shimmer_effect.dart';
import 'package:book_mart/features/home/data/models/slider_images_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class ImageSlider extends StatefulWidget {
  final List<SliderImages> images;

  const ImageSlider({
    super.key,
    required this.images,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              children: [
                ...widget.images.map(
                      (e) {
                    return CachedNetworkImage(
                      imageUrl: e.image,
                      fit: BoxFit.cover,
                      height: 180.h,
                      width: double.infinity,
                      placeholder: (context, url) => ShimmerEffect(
                          width: double.infinity,
                          height: 180.h,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    );
                  },
                )
              ],
            ),
          ),
          verticalSpace(8),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: ColorsManager.mainBinkColor,
              dotColor: Colors.grey,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
        ],
      ),
    );
  }
}