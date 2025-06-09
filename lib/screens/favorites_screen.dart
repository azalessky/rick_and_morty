import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/providers/providers.dart';
import 'package:rick_and_morty/widgets/widgets.dart';

@RoutePage()
class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  final listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    ref.listenManual(favoritesStateProvider, (prev, next) => _syncListState(prev, next));
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoritesStateProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FavoritesScreen.Title'.tr()),
      ),
      body: favorites.items.isEmpty
          ? SpacePlaceholder(text: 'FavoritesScreen.Empty'.tr())
          : AnimatedList(
              key: listKey,
              initialItemCount: favorites.items.length,
              itemBuilder: (context, index, animation) => _buildListItem(
                index,
                favorites.items[index],
                animation,
              ),
            ),
    );
  }

  Widget _buildListItem(int index, Character character, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation.drive(
        CurveTween(curve: Curves.easeInOut),
      ),
      axis: Axis.vertical,
      child: FadeTransition(
        opacity: animation.drive(
          CurveTween(curve: Curves.easeInOut),
        ),
        child: CharacterListItem(
          character: character,
          onToggleFavorite: (value) => value ? null : _handleRemoveFavorite(index, character),
        ),
      ),
    );
  }

  void _handleRemoveFavorite(int index, Character character) async {
    await ref.read(favoritesStateProvider.notifier).toggleFavorite(character);
  }

  void _syncListState(FavoriteList? prev, FavoriteList next) {
    final oldItems = prev?.items ?? [];
    final newItems = next.items;

    if (oldItems.length > newItems.length) {
      final index = _findChangedIndex(oldItems, newItems);
      if (index >= 0 && listKey.currentState != null) {
        listKey.currentState!.removeItem(
          index,
          (context, animation) => _buildListItem(index, oldItems[index], animation),
        );
      }
    } else if (newItems.length > oldItems.length) {
      final index = _findChangedIndex(newItems, oldItems);
      if (index >= 0 && listKey.currentState != null) {
        listKey.currentState!.insertItem(index);
      }
    }
  }

  int _findChangedIndex(List<Character> source, List<Character> target) {
    final ids = target.map((item) => item.id).toSet();
    for (int i = 0; i < source.length; i++) {
      if (!ids.contains(source[i].id)) {
        return i;
      }
    }
    return -1;
  }
}
