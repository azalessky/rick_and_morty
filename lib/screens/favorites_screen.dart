import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/providers/providers.dart';
import 'package:rick_and_morty/widgets/widgets.dart';

@RoutePage()
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characters = ref.watch(charactersStateProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FavoritesScreen.Title'.tr()),
      ),
      body: characters.when(
        data: (data) {
          final items = data.items.where((c) => c.favorite).toList();
          items.sort((a, b) => a.name.compareTo(b.name));

          return items.isEmpty
              ? EmptyPlaceholder(text: 'FavoritesScreen.Empty'.tr())
              : _buildListView(items);
        },
        error: (_, _) => ErrorPlaceholder(text: 'FavoritesScreen.Error'.tr()),
        loading: () => CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildListView(List<Character> characters) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return CharacterListItem(
          key: ValueKey(character.id),
          character: character,
        );
      },
    );
  }
}
