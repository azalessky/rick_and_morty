import 'package:get_it/get_it.dart';

import 'package:rick_and_morty/repositories/repositories.dart';
import 'package:rick_and_morty/services/services.dart';

final getIt = GetIt.instance;
final localRepository = getIt<LocalRepository>();
final remoteRepository = getIt<RemoteRepository>();

class Dependencies {
  static Future<void> initialize() async {
    getIt.registerSingletonAsync<LocalRepository>(
      () async => LocalRepository(storage: await StorageService.getInstance()),
    );
    getIt.registerSingleton<RemoteRepository>(
      RemoteRepository(api: ApiService()),
    );
    return getIt.allReady();
  }
}
