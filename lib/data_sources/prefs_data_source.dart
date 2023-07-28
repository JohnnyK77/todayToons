import 'package:shared_preferences/shared_preferences.dart';

class PrefsDataSource {
  final keyLikedToons = 'likedToons';
  SharedPreferences? prefs;

  Future<void> getSharedPreferences() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setStringList(String key, List<String> value) async {
    await getSharedPreferences();
    prefs!.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    await getSharedPreferences();
    return prefs!.getStringList(key);
  }
}
