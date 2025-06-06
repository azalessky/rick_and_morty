import 'package:get_it/get_it.dart';

import 'package:rick_and_morty/repositories/repositories.dart';
import 'package:rick_and_morty/services/services.dart';

final getIt = GetIt.I;

final localRepository = getIt<LocalRepository>();
final remoteRepository = getIt<RemoteRepository>();

class Depedencies {
  static Future<void> initialize() async {
    getIt.registerSingletonAsync<LocalRepository>(
      () => LocalRepository.getInstance(),
    );
    getIt.registerSingleton<RemoteRepository>(
      RemoteRepository(api: ApiService()),
    );
    return getIt.allReady();
  }
}
