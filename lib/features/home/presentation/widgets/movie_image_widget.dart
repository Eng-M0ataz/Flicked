import 'package:cached_network_image/cached_network_image.dart';
import 'package:flickd/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MovieImageCustomWidget extends StatelessWidget {
  const MovieImageCustomWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
