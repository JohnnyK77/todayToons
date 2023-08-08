import 'package:hive/hive.dart';
import 'package:toonflix/data/data_source/local/local_data_source.dart';

class LocalDataSourceHive implements LocalDataSource {
  final boxName = 'myBox';
  final keyLikedToons = 'likedToons'; //webtoon 상세페이지 하트

  @override
  Future<void> setLikeList(List<String> list) async {
    var box = await Hive.openBox(boxName);
    box.put(keyLikedToons, list);
  }

  @override
  Future<List<String>?> getLikeList() async {
    var box = await Hive.openBox(boxName);
    List<String>? list = box.get(keyLikedToons);
    return list;
  }
}
