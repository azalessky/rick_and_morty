import 'package:rick_and_morty/models/models.dart';

class RemoteRepository {
  Future<CharacterList> getCharacters(CharacterList? current) async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 1));

    // Return dummy data
    return CharacterList(
      prev: '',
      next: '',
      items: List.generate(
        20,
        (index) => Character(
          id: '${index + 1}',
          name: 'Character ${index + 1}',
          species: 'Human',
          image: 'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
        ),
      ),
    );
  }
}
