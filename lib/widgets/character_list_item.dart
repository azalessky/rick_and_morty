import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/helpers/helpers.dart';
import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/providers/providers.dart';
import 'package:rick_and_morty/widgets/widgets.dart';

class CharacterListItem extends ConsumerWidget {
  static const iconOffset = -6.0;
  static const itemPadding = EdgeInsets.symmetric(horizontal: 32, vertical: 8);

  final Character character;

  const CharacterListItem({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: itemPadding,
      child: Row(
        spacing: FormLayout.extraLargeSpacing,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                CharacterImage(imageUrl: character.image),
                Positioned(
                  top: iconOffset,
                  right: iconOffset,
                  child: FavoriteIcon(
                    character: character,
                    onPressed: () =>
                        ref.read(charactersStateProvider.notifier).toggleFavorite(character),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: FormLayout.smallSpacing,
              children: [
                context.textLarge(character.name),
                context.textMedium(character.species),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
