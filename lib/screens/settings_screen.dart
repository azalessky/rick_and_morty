import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/providers/providers.dart';
import 'package:rick_and_morty/dialogs/dialogs.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsStateProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SettingsScreen.Title'.tr()),
      ),
      body: Column(
        children: [
          _buildThemeMode(context, ref, settings),
        ],
      ),
    );
  }

  Widget _buildThemeMode(BuildContext context, WidgetRef ref, Settings settings) {
    return ListTile(
      leading: const Icon(Icons.dark_mode_outlined),
      title: Text('SettingsScreen.ThemeMode'.tr()),
      subtitle: Text('${settings.themeMode}'.tr()),
      onTap: () => showModalDialog<ThemeMode>(
        context: context,
        builder: (_) => ValueListDialog(
          title: 'SettingsScreen.ThemeMode'.tr(),
          values: ThemeMode.values,
          initialValue: settings.themeMode,
          textBuilder: (value) => '$value'.tr(),
        ),
        onSaved: (value) => _updateThemeMode(ref, value),
      ),
    );
  }

  void _updateThemeMode(WidgetRef ref, ThemeMode value) {
    ref.read(settingsStateProvider.notifier).themeMode = value;
  }
}
