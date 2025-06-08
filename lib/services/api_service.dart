import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/models/models.dart';

enum ApiError { general, connection, server, data }

class ApiException implements Exception {
  final ApiError error;

  const ApiException(this.error);

  @override
  String toString() => 'ApiException: $error';
}

class ApiService {
  Future<CharacterList> getCharacters(String? url) async {
    try {
      url ??= ApiSettings.characterEndpoint;
      final response = await http
          .get(Uri.parse(url))
          .timeout(
            ApiSettings.requestTimeout,
            onTimeout: () => throw ApiException(ApiError.connection),
          );

      if (response.statusCode == 200) {
        try {
          final data = json.decode(response.body);
          final results = data['results'];

          final prev = data['info']['prev'] ?? '';
          final next = data['info']['next'] ?? '';
          final items = results.map<Character>((json) {
            json['favorite'] = false;
            return Character.fromJson(json);
          }).toList();

          return CharacterList(prev: prev, next: next, items: items);
        } catch (e) {
          throw ApiException(ApiError.data);
        }
      } else {
        throw ApiException(ApiError.server);
      }
    } catch (e) {
      throw ApiException(
        e is SocketException ? ApiError.connection : ApiError.general,
      );
    }
  }
}
