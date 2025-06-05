import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:rick_and_morty/common/common.dart';

class CharacterImage extends StatelessWidget {
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
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(FormLayout.imageRadius),
        child: Image(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
