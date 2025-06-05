import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/models/models.dart';

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => 'ApiException: $message';
}

class ApiService {
  Future<CharacterList> getCharacters(String? url) async {
    try {
      url ??= ApiSettings.characterEndpoint;
      final response = await http
          .get(Uri.parse(url))
          .timeout(
            ApiSettings.requestTimeout,
            onTimeout: () => throw ApiException('Request timed out'),
          );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'];

        final prev = data['info']['prev'] ?? '';
        final next = data['info']['next'] ?? '';
        final items = results.map<Character>((json) {
          json['favorite'] = false;
          return Character.fromJson(json);
        }).toList();

        return CharacterList(prev: prev, next: next, items: items);
      } else {
        throw ApiException('Error when loading data: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Error during server request: $e');
    }
  }
}
