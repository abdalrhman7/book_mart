import 'package:book_mart/core/widgets/shimmer/shimmer_effect.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ProductDetailsImage extends StatelessWidget {
  final String imageUrl;
  const ProductDetailsImage({
    super.key, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        height: 180.h,
        width: double.infinity,
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        placeholder: (context, url) =>
            ShimmerEffect(
              width: 170,
              height: 170,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
        errorWidget: (context, url, error) =>
        const Icon(Icons.error),
      ),
    );
  }
}