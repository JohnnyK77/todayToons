import 'package:toonflix/data/data_source/local/local_data_source.dart';
import 'package:toonflix/domain/repository/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  @override
  LocalDataSource localDataSource;

  LocalRepositoryImpl(this.localDataSource);

  @override
  Future<void> setLikeList(List<String> list) async {
    localDataSource.setLikeList(list);
  }

  @override
  Future<List<String>?> getLikeList() async {
    return localDataSource.getLikeList();
  }
}
