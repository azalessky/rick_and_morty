import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:rick_and_morty/common/constants.dart';

class CharacterImage extends StatelessWidget {
  static const imageRadius = 12.0;
  static const imagePlaceholder = AssetImage(ResourceSettings.imagePlaceholder);

  final String imageUrl;

  const CharacterImage({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        imageBuilder: (_, imageProvider) => _roundImageCorners(
          imageProvider,
        ),
        placeholder: (_, _) => Container(),
        errorWidget: (_, _, _) => _roundImageCorners(
          imagePlaceholder,
        ),
      ),
    );
  }

  Widget _roundImageCorners(ImageProvider image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(imageRadius),
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
