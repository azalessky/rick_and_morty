import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/helpers/helpers.dart';

import 'package:rick_and_morty/models/models.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;

  const CharacterListItem({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FormLayout.listItemPadding,
      child: Column(
        children: [
          _buildCharacterImage(),
          FormLayout.mediumSpacer,
          _buildCharacterInfo(context),
          FormLayout.largeSpacer,
        ],
      ),
    );
  }

  Widget _buildCharacterImage() {
    return CachedNetworkImage(
      imageUrl: character.image,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(FormStyles.imageRadius),
        child: Image(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCharacterInfo(BuildContext context) {
    return context.textLarge(
      character.name,
    );
  }
}
