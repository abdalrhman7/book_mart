import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/widgets/shimmer/shimmer_effect.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      centerTitle: true,
      title: SvgPicture.asset('assets/images/app_bar_logo.svg'),
      actions:  [
        CachedNetworkImage(
          imageUrl:  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1024px-Circle-icons-profile.svg.png',
          fit: BoxFit.fill,
          height: 40,
          width: 40,
          placeholder: (context, url) =>
          const ShimmerEffect(width:  40, height:  40, shape: CircleBorder()),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
        ),
        horizontalSpace(12),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
