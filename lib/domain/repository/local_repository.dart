abstract class LocalRepository {
  Future<void> setLikeList(List<String> list);
  Future<List<String>?> getLikeList();
}
