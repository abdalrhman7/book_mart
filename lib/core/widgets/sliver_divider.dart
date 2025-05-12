import 'package:flutter/material.dart';

class SliverDivider extends StatelessWidget {
  const SliverDivider({
    super.key, this.height,
  });
  final double? height ;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Divider(color: Colors.grey.shade300, height: height ?? 1,),
    );
  }
}
