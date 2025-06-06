import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/models/models.dart';

part 'settings_state.g.dart';

@Riverpod(keepAlive: true)
class SettingsState extends _$SettingsState {
  @override
  Settings build() {
    return localRepository.loadSettings() ?? Settings.empty();
  }

  set themeMode(ThemeMode value) {
    state = state.copyWith(themeMode: value);
    localRepository.saveSettings(state);
  }
}
