abstract class LocalDataSource {
  Future<void> setLikeList(List<String> list);
  Future<List<String>?> getLikeList();
}
