import 'package:toonflix/data/data_source/local_data_source.dart';
import 'package:toonflix/data/locator.dart';

class LocalRepository {
  final LocalDataSource _localDataSource = locator.get<LocalDataSource>();

  Future<void> setLikeList(List<String> list) async {
    _localDataSource.setLikeList(list);
  }

  Future<List<String>?> getLikeList() async {
    return _localDataSource.getLikeList();
  }
}
