import 'package:book_mart/core/widgets/shimmer/shimmer_effect.dart' ;
import 'package:flutter/material.dart';

class ProductShimmerEffect extends StatelessWidget {
  const ProductShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              6,
                  (index) {
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsetsDirectional.only(end: 12),
                  elevation: .6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ShimmerEffect(
                            width: 170,
                            height: 170,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsetsDirectional.only(start: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerEffect(width: 100, height: 16),
                              SizedBox(height: 4),
                              ShimmerEffect(width: 80, height: 14),
                              SizedBox(height: 4),
                              ShimmerEffect(width: 60, height: 14),
                              SizedBox(height: 4),
                              ShimmerEffect(width: 50, height: 14),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  SizedBox(width: 4),
                                  ShimmerEffect(width: 20, height: 14),
                                  SizedBox(width: 8),
                                  ShimmerEffect(width: 40, height: 14),
                                ],
                              ),
                              SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
