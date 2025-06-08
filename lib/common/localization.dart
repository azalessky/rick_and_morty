import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty/common/common.dart';

class Localization extends StatelessWidget {
  final Widget child;

  const Localization({
    required this.child,
    super.key,
  });

  static Future<void> initialize() async {
    EasyLocalization.logger.enableBuildModes = [];
    await EasyLocalization.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      ignorePluralRules: false,
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      path: ResourceSettings.localizatioPath,
      fallbackLocale: const Locale('en'),
      child: child,
    );
  }
}
