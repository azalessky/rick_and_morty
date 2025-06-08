import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:rick_and_morty/common/constants.dart';

class CharacterImage extends StatelessWidget {
  static const imageRadius = 12.0;

  final String imageUrl;

  const CharacterImage({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      imageBuilder: (_, imageProvider) => _buildImageFrame(
        Image(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
      placeholder: (_, _) => _buildImageFrame(
        AspectRatio(
          aspectRatio: 1.0,
          child: Container(),
        ),
      ),
      errorWidget: (_, _, _) => _buildImageFrame(
        Image.asset(
          ResourceSettings.imagePlaceholder,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildImageFrame(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageRadius),
      child: child,
    );
  }
}
