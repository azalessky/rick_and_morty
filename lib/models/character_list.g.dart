// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterList _$CharacterListFromJson(Map<String, dynamic> json) =>
    _CharacterList(
      prev: json['prev'] as String,
      next: json['next'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterListToJson(_CharacterList instance) =>
    <String, dynamic>{
      'prev': instance.prev,
      'next': instance.next,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
