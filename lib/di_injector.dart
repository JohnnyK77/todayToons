import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/data/data_source/local/local_data_source.dart';
import 'package:toonflix/data/data_source/local/local_data_source_hive.dart';
import 'package:toonflix/data/data_source/remote/remote_data_source_impl.dart';
import 'package:toonflix/data/data_source/remote/remote_data_source.dart';
import 'package:toonflix/data/repository/local_repository_impl.dart';
import 'package:toonflix/data/repository/webtoon_repository_impl.dart';
import 'package:toonflix/domain/repository/local_repository.dart';
import 'package:toonflix/domain/repository/webtoon_repository.dart';
import 'package:toonflix/domain/usecase/like_get_use_case.dart';
import 'package:toonflix/domain/usecase/like_set_use_case.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_detail_usecase.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_episodes_usecase.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_today_list_usecase.dart';

GetIt locator = GetIt.instance;

initLocator() {
  locator.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  //usecase
  locator.registerLazySingleton<WebtoonTodayListUsecase>(
      () => WebtoonTodayListUsecase(locator<WebtoonRepository>()));
  locator.registerLazySingleton<WebtoonDetailUseCase>(
      () => WebtoonDetailUseCase(locator<WebtoonRepository>()));
  locator.registerLazySingleton<WebtoonEpisodesUseCase>(
      () => WebtoonEpisodesUseCase(locator<WebtoonRepository>()));

  locator.registerLazySingleton<LikeGetUseCase>(
      () => LikeGetUseCase(locator<LocalRepository>()));
  locator.registerLazySingleton<LikeSetUseCase>(
      () => LikeSetUseCase(locator<LocalRepository>()));

  //repository implementation
  locator.registerLazySingleton<WebtoonRepository>(
      () => WebtoonRepositoryImpl(locator<RemoteDataSource>()));
  locator.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(locator<LocalDataSource>()));

  //datasource implementation
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  // locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceHive());
}
