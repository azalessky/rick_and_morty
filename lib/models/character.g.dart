// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Character _$CharacterFromJson(Map<String, dynamic> json) => _Character(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  species: json['species'] as String,
  image: json['image'] as String,
  favorite: json['favorite'] as bool,
);

Map<String, dynamic> _$CharacterToJson(_Character instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'species': instance.species,
      'image': instance.image,
      'favorite': instance.favorite,
    };
