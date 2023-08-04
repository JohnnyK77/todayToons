import 'package:get_it/get_it.dart';
import 'package:toonflix/data/data_source/remote_data_source.dart';

GetIt locator = GetIt.instance;

initLocator() {
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
}
