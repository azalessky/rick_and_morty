import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rick_and_morty/models/models.dart';

part 'settings.g.dart';

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  Config build() {
    return Config.empty();
  }

  set themeMode(ThemeMode value) {
    state = state.copyWith(themeMode: value);
  }
}
