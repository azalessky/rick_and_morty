import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:rick_and_morty/common/routes.dart';
import 'package:rick_and_morty/widgets/widgets.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const routes = [
      CharactersRoute(),
      FavoritesRoute(),
      SettingsRoute(),
    ];

    return AutoTabsScaffold(
      routes: routes,
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: (index) => tabsRouter.setActiveIndex(index),
      ),
    );
  }
}
