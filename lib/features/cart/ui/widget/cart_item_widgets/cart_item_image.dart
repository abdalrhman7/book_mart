import 'package:book_mart/core/widgets/shimmer/shimmer_effect.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key, required this.imageUrl});
  final String imageUrl ;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        height: 126.h,
        width: 100.w,
        placeholder: (context, url) => ShimmerEffect(
          width: double.infinity,
          height: 120.h,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}