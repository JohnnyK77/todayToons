import 'package:toonflix/domain/repository/local_repository.dart';

/// 하트 리스트 셋팅
class LikeSetUseCase {
  LocalRepository localRepository;

  LikeSetUseCase(this.localRepository);

  Future<void> fetch(List<String> list) async {
    await localRepository.setLikeList(list);
  }
}
