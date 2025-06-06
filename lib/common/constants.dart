import 'package:flutter/material.dart';

class ApiSettings {
  static const characterEndpoint = 'https://rickandmortyapi.com/api/character';
  static const requestTimeout = Duration(seconds: 30);
}

class RepositorySettings {
  static const charactersKey = 'characters';
  static const settingsKey = 'settings';
}

class DefaultSettings {
  static const themeMode = ThemeMode.dark;
}

class FormLayout {
  static const smallSpacing = 6.0;
  static const mediumSpacing = 8.0;
  static const largeSpacing = 12.0;
  static const extraLargeSpacing = 20.0;
  static const imageRadius = 12.0;
  static const listItemPadding = EdgeInsets.symmetric(horizontal: 32, vertical: 12);
}

class DialogPaddings {
  static const screeniOS = EdgeInsets.only(top: 8, bottom: 32);
  static const screenAndroid = EdgeInsets.only(top: 8, bottom: 24);
  static const keyboardAndroid = EdgeInsets.only(top: 8, bottom: 12);
  static const keyboardiOS = EdgeInsets.only(top: 8, bottom: 12);

  static const dialogTitle = EdgeInsets.only(top: 12, left: 24, right: 24);
  static const defaultContent = EdgeInsets.symmetric(vertical: 8);
  static const actionButtons = EdgeInsets.symmetric(horizontal: 32);

  static const valueContent = EdgeInsets.symmetric(vertical: 4);
  static const valueTile = EdgeInsets.symmetric(horizontal: 24);
}
