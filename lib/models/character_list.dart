import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rick_and_morty/models/models.dart';

part 'character_list.freezed.dart';
part 'character_list.g.dart';

@freezed
abstract class CharacterList with _$CharacterList {
  const CharacterList._();

  const factory CharacterList({
    required String prev,
    required String next,
    required List<Character> items,
  }) = _CharacterList;

  bool get isFirst => prev.isEmpty;
  bool get hasMore => next.isNotEmpty;

  factory CharacterList.fromJson(Map<String, dynamic> json) => _$CharacterListFromJson(json);

  factory CharacterList.empty() => CharacterList(
    prev: '',
    next: '',
    items: [],
  );
}
