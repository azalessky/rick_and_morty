import 'package:rick_and_morty/common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rick_and_morty/models/models.dart';

part 'characters_state.g.dart';

@Riverpod(keepAlive: true)
class CharactersState extends _$CharactersState {
  @override
  Future<CharacterList> build() => loadData();

  Future<CharacterList> loadData() async {
    // TODO: Load from persistent storage
    return remoteRepository.getCharacters(null);
  }

  Future<void> loadNext() async {
    state = await AsyncValue.guard(() async {
      return remoteRepository.getCharacters(state.requireValue);
    });
  }
}
