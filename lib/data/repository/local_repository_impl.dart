import 'package:toonflix/data/data_source/local/local_data_source.dart';
import 'package:toonflix/di_injector.dart';
import 'package:toonflix/domain/repository/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  final LocalDataSource localDataSource = locator.get<LocalDataSource>();

  @override
  Future<void> setLikeList(List<String> list) async {
    localDataSource.setLikeList(list);
  }

  @override
  Future<List<String>?> getLikeList() async {
    return localDataSource.getLikeList();
  }
}
