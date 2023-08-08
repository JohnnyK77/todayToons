import 'package:toonflix/data/data_source/local/local_data_source.dart';

abstract class LocalRepository {
  LocalDataSource localDataSource;

  LocalRepository(this.localDataSource);

  Future<void> setLikeList(List<String> list);
  Future<List<String>?> getLikeList();
}
