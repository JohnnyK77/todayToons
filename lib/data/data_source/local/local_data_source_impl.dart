import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/data/data_source/local/local_data_source.dart';
import 'package:toonflix/di_injector.dart';

class LocalDataSourceImpl extends LocalDataSource {
  final SharedPreferences _prefs = locator.get<SharedPreferences>();
  final keyLikedToons = 'likedToons'; //webtoon 상세페이지 하트

  @override
  Future<void> setLikeList(List<String> list) async {
    _prefs.setStringList(keyLikedToons, list);
  }

  @override
  Future<List<String>?> getLikeList() async {
    return _prefs.getStringList(keyLikedToons);
  }
}
