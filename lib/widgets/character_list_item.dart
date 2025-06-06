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
      child: Row(
        spacing: FormLayout.extraLargeSpacing,
        children: [
          Expanded(
            flex: 1,
            child: CharacterImage(imageUrl: character.image),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: FormLayout.smallSpacing,
              children: [
                //     _buildFavoriteIcon(ref),
                context.textLarge(character.name),
                context.textMedium(character.species),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteIcon(WidgetRef ref) {
    return IconButton(
      icon: Icon(
        character.favorite ? Icons.star : Icons.star_border,
        color: character.favorite ? Colors.yellow : Colors.grey,
      ),
      onPressed: () => ref.read(charactersStateProvider.notifier).toggleFavorite(character),
    );
  }
}
