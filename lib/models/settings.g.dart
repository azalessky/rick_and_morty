// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Settings _$SettingsFromJson(Map<String, dynamic> json) =>
    _Settings(themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']));

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
  'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
