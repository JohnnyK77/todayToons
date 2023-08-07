import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/data/data_source/local/local_data_source.dart';
import 'package:toonflix/data/data_source/local/local_data_source_hive.dart';
import 'package:toonflix/data/data_source/remote/remote_data_source_impl.dart';
import 'package:toonflix/data/data_source/remote/remote_data_source.dart';

GetIt locator = GetIt.instance;

initLocator() {
  locator.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  // locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceHive());
}
