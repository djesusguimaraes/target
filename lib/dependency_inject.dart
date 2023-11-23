import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target/core/rest_client/dio_client.dart';
import 'package:target/repositories/auth_repository.dart';
import 'package:target/services/storage_service.dart';
import 'package:target/ui/auth/auth_store.dart';
import 'package:target/ui/home/home_store.dart';
import 'package:target/router/router_store.dart';

Future<void> injectDependencies() async {
  final getIt = GetIt.instance;

  getIt.registerSingleton<Dio>(getApiClient());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(client: getIt<Dio>()));
  getIt.registerSingleton<AuthStore>(AuthStore(repository: getIt<AuthRepository>()));

  getIt.registerSingleton(RouterStore(authStore: getIt<AuthStore>()));

  getIt.registerSingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());
  getIt.registerSingletonAsync(() async => StorageService(storage: getIt<SharedPreferences>()), dependsOn: [SharedPreferences]);
  getIt.registerLazySingleton(() => HomeStore(storageService: getIt<StorageService>()));
}
