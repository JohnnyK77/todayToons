import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/data/locator.dart';

class PrefsDataSource {
  final keyLikedToons = 'likedToons'; //webtoon 상세페이지 하트
  SharedPreferences prefs = locator.get<SharedPreferences>();

  Future<void> setStringList(String key, List<String> value) async {
    prefs.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    return prefs.getStringList(key);
  }
}
