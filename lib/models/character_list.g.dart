// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterList _$CharacterListFromJson(Map<String, dynamic> json) =>
    _CharacterList(
      items: (json['items'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      prev: json['prev'] as String,
      next: json['next'] as String,
    );

Map<String, dynamic> _$CharacterListToJson(_CharacterList instance) =>
    <String, dynamic>{
      'items': instance.items,
      'prev': instance.prev,
      'next': instance.next,
    };
