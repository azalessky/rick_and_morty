import 'package:get_it/get_it.dart';

import 'package:rick_and_morty/repositories/repositories.dart';
import 'package:rick_and_morty/services/api_service.dart';

final getIt = GetIt.I;

//final cachedRepository = getIt<CachedRepository>();
final remoteRepository = getIt<RemoteRepository>();
//final localRepository = getIt<LocalRepository>();

class Depedencies {
  static Future<void> initialize() async {
    // getIt.registerSingletonWithDependencies<LocalRepository>(
    //   () => LocalRepository(prefs: getIt.get<SharedPreferences>()),
    //   dependsOn: [SharedPreferences],
    // );
    getIt.registerSingleton<RemoteRepository>(
      RemoteRepository(api: ApiService()),
    );
    // getIt.registerSingletonWithDependencies<CachedRepository>(
    //   () => CachedRepository(
    //     local: getIt.get<LocalRepository>(),
    //     remote: getIt.get<RemoteRepository>(),
    //   ),
    //   dependsOn: [LocalRepository],
    // );
    return getIt.allReady();
  }
}
