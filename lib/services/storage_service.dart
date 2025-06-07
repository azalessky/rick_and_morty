import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences prefs;

  const StorageService._({required this.prefs});

  static Future<StorageService> getInstance() async {
    return StorageService._(prefs: await SharedPreferences.getInstance());
  }

  Future<void> saveData(String key, Object data) async {
    await prefs.setString(key, jsonEncode(data));
  }

  T? loadData<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final data = prefs.getString(key);
    return data == null ? null : fromJson(jsonDecode(data));
  }
}
