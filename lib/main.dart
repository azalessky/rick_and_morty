import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:rick_and_morty/common/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Localization.initialize();

  runApp(
    Localization(
      child: MainApp(routes: Routes()),
    ),
  );
}

class MainApp extends StatelessWidget {
  final Routes routes;

  const MainApp({required this.routes, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateTitle: (_) => 'App.Title'.tr(),
      routerConfig: routes.config(),
    );
  }
}
