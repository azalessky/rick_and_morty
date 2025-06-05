// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Config _$ConfigFromJson(Map<String, dynamic> json) =>
    _Config(themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']));

Map<String, dynamic> _$ConfigToJson(_Config instance) => <String, dynamic>{
  'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
