import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
abstract class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required String species,
    required String image,
    required bool favorite,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  factory Character.empty() => Character(
    id: 0,
    name: '',
    species: '',
    image: '',
    favorite: false,
  );
}
