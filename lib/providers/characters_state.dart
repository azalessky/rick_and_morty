import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/services/services.dart';
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

      try {
        final data = await remoteRepository.loadCharacters(current);
        await localRepository.saveCharacters(data);
        return data;
      } on ApiException catch (_) {
        // if (current != null) {
        //   return current;
        // } else {
        rethrow;
        //   }
      }
    });
  }
}
