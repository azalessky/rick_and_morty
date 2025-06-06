import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/models/models.dart';

class LocalRepository {
  final SharedPreferences prefs;

  const LocalRepository._({required this.prefs});

  static Future<LocalRepository> getInstance() async {
    return LocalRepository._(prefs: await SharedPreferences.getInstance());
  }

  Future<void> saveCharacters(CharacterList data) async {
    await prefs.setString(RepositorySettings.charactersKey, jsonEncode(data));
  }

  CharacterList? loadCharacters() {
    final data = prefs.getString(RepositorySettings.charactersKey);
    return data == null ? null : CharacterList.fromJson(jsonDecode(data));
  }

  Future<void> saveSettings(Settings data) async {
    await prefs.setString(RepositorySettings.settingsKey, jsonEncode(data));
  }

  Settings? loadSettings() {
    final data = prefs.getString(RepositorySettings.settingsKey);
    return data == null ? null : Settings.fromJson(jsonDecode(data));
  }
}
