import 'package:auto_route/auto_route.dart';

import 'package:rick_and_morty/screens/screens.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class Routes extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      children: [
        AutoRoute(page: CharactersRoute.page),
        AutoRoute(page: FavoritesRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
  ];
}
