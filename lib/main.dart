import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rick_and_morty/common/common.dart';
import 'package:rick_and_morty/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  await Depedencies.initialize();
  await Localization.initialize();

  runApp(
    Localization(
      child: MainApp(
        routes: Routes(),
        themes: Themes(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  final Routes routes;
  final Themes themes;

  const MainApp({
    required this.routes,
    required this.themes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, _) => _buildApp(context, ref),
      ),
    );
  }

  Widget _buildApp(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsStateProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateTitle: (_) => 'App.Title'.tr(),
      themeMode: settings.themeMode,
      theme: themes.lightTheme(),
      darkTheme: themes.darkTheme(),
      routerConfig: routes.config(),
    );
  }
}
