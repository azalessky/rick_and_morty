import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/services/services.dart';

class RemoteRepository {
  final ApiService api;

  const RemoteRepository({required this.api});

  Future<CharacterList> loadCharacters(CharacterList? current) async {
    if (current == null || current.hasMore) {
      final characters = await api.getCharacters(current?.next);
      return CharacterList(
        prev: characters.prev,
        next: characters.next,
        items: [...?current?.items, ...characters.items],
      );
    } else {
      return current;
    }
  }
}
