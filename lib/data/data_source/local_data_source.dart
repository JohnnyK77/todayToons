import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/data/locator.dart';

class LocalDataSource {
  final SharedPreferences _prefs = locator.get<SharedPreferences>();
  final keyLikedToons = 'likedToons'; //webtoon 상세페이지 하트

  Future<void> setLikeList(List<String> list) async {
    _prefs.setStringList(keyLikedToons, list);
  }

  Future<List<String>?> getLikeList() async {
    return _prefs.getStringList(keyLikedToons);
  }
}
