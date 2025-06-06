import 'package:rick_and_morty/common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rick_and_morty/models/models.dart';

part 'characters_state.g.dart';

@Riverpod(keepAlive: true)
class CharactersState extends _$CharactersState {
  @override
  Future<CharacterList> build() async {
    return localRepository.loadCharacters() ?? CharacterList.empty();
  }

  Future<void> loadNext() async {
    state = await AsyncValue.guard(() async {
      final current = state.hasValue && state.requireValue.items.isNotEmpty
          ? state.requireValue
          : null;
      final data = await remoteRepository.loadCharacters(current);

      await localRepository.saveCharacters(data);
      return data;
    });
  }

  Future<void> toggleFavorite(Character character) async {
    if (!state.hasValue) return;

    final items = [...state.requireValue.items];
    final index = items.indexWhere((c) => c.id == character.id);
    if (index < 0) return;

    final item = items[index];
    items[index] = item.copyWith(favorite: !item.favorite);
    state = AsyncValue.data(state.requireValue.copyWith(items: items));

    await localRepository.saveCharacters(state.requireValue);
  }
}
