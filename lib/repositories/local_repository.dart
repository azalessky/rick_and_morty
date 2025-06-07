import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/services/services.dart';
import 'package:rick_and_morty/models/models.dart';

class LocalRepository {
  final StorageService storage;

  LocalRepository({required this.storage});

  Future<void> saveCharacters(CharacterList data) async {
    return storage.saveData(RepositorySettings.charactersKey, data);
  }

  CharacterList? loadCharacters() {
    return storage.loadData(RepositorySettings.charactersKey, CharacterList.fromJson);
  }

  Future<void> saveSettings(Settings data) async {
    return storage.saveData(RepositorySettings.settingsKey, data);
  }

  Settings? loadSettings() {
    return storage.loadData(RepositorySettings.settingsKey, Settings.fromJson);
  }
}
