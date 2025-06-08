import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/models/models.dart';

part 'favorites_state.g.dart';

@Riverpod(keepAlive: true)
class FavoritesState extends _$FavoritesState {
  @override
  FavoriteList build() {
    return localRepository.loadFavorites() ?? FavoriteList.empty();
  }

  bool isFavorite(Character character) {
    return state.items.any((c) => c.id == character.id);
  }

  Future<bool> toggleFavorite(Character character) async {
    if (isFavorite(character)) {
      await _removeItem(character);
      return false;
    } else {
      await _addItem(character);
      return true;
    }
  }

  Future<void> _addItem(Character character) async {
    final items = [...state.items, character];
    items.sort((a, b) => a.name.compareTo(b.name));

    state = state.copyWith(items: items);
    await localRepository.saveFavorites(state);
  }

  Future<void> _removeItem(Character character) async {
    final items = [...state.items];
    items.removeWhere((c) => c.id == character.id);
    items.sort((a, b) => a.name.compareTo(b.name));

    state = state.copyWith(items: items);
    await localRepository.saveFavorites(state);
  }
}
