// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteList _$FavoriteListFromJson(Map<String, dynamic> json) =>
    _FavoriteList(
      items: (json['items'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavoriteListToJson(_FavoriteList instance) =>
    <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};
