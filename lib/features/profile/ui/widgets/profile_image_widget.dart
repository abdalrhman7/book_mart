import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key, required this.imageUrl,
  });

  final String? imageUrl ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: imageUrl == null
          ? const Icon(Icons.person, size: 60)
          : ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
        ),
      ),
    );
  }
}
