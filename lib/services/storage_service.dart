import 'dart:convert';

import 'package:flutter/foundation.dart';
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
    if (data == null) return null;

    try {
      return fromJson(jsonDecode(data));
    } catch (e) {
      debugPrint('StorageService::loadData: key = $key, $e');
      return null;
    }
  }
}
