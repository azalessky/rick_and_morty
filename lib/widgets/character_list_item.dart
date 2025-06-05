import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/helpers/helpers.dart';
import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/providers/providers.dart';
import 'package:rick_and_morty/widgets/widgets.dart';

class CharacterListItem extends ConsumerWidget {
  final Character character;

  const CharacterListItem({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: FormLayout.listItemPadding,
      child: Column(
        children: [
          Stack(
            children: [
              CharacterImage(imageUrl: character.image),
              _buildFavoriteIcon(ref),
            ],
          ),
          FormLayout.mediumSpacer,
          context.textLarge(character.name),
          FormLayout.largeSpacer,
        ],
      ),
    );
  }

  Widget _buildFavoriteIcon(WidgetRef ref) {
    return Positioned(
      top: 0,
      right: 0,
      child: IconButton(
        icon: Icon(
          character.favorite ? Icons.favorite : Icons.favorite_border,
          color: character.favorite ? Colors.red : Colors.red,
        ),
        onPressed: () => ref.read(charactersStateProvider.notifier).toggleFavorite(character),
      ),
    );
  }
}
