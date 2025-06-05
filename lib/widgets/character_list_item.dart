import 'package:flutter/material.dart';

import 'package:rick_and_morty/models/models.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;

  const CharacterListItem({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(character.image),
        radius: 24,
      ),
      title: Text(character.name),
      subtitle: Text(character.species),
      onTap: () {
        // Handle tap action, e.g., navigate to character details
      },
    );
  }
}
