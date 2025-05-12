import 'package:book_mart/core/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';



class ShimmerBooksGridView extends StatelessWidget {
  const ShimmerBooksGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 8,
          childAspectRatio: 0.62,
        ),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsetsDirectional.only(end: 12),
            elevation: 0.6,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerEffect(
                    height: 170,
                    width: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const ShimmerEffect(height: 12, width: 100),
                  const SizedBox(height: 4),
                  const ShimmerEffect(height: 12, width: 80),
                  const SizedBox(height: 4),
                  const ShimmerEffect(height: 12, width: 60),
                  const SizedBox(height: 4),
                  const Row(
                    children: [
                      ShimmerEffect(height: 12, width: 40),
                      SizedBox(width: 8),
                      ShimmerEffect(height: 12, width: 30),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}