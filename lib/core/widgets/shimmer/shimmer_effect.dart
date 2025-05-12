import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shape;

  const ShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.shape = const RoundedRectangleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: shape,
        ),
      ),
    );
  }
}
