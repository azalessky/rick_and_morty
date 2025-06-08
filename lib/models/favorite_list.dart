import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rick_and_morty/models/models.dart';

part 'favorite_list.freezed.dart';
part 'favorite_list.g.dart';

@freezed
abstract class FavoriteList with _$FavoriteList {
  const FavoriteList._();

  const factory FavoriteList({
    required List<Character> items,
  }) = _FavoriteList;

  factory FavoriteList.fromJson(Map<String, dynamic> json) => _$FavoriteListFromJson(json);

  factory FavoriteList.empty() => FavoriteList(items: []);
}
