import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rick_and_morty/models/models.dart';

part 'settings_state.g.dart';

@Riverpod(keepAlive: true)
class SettingsState extends _$SettingsState {
  @override
  Settings build() {
    // TODO: Load from persistent storage
    return Settings.empty();
  }

  set themeMode(ThemeMode value) {
    state = state.copyWith(themeMode: value);
  }
}
