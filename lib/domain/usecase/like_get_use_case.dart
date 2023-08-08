import 'package:toonflix/domain/repository/local_repository.dart';

/// 하트 리스트 가져오기
class LikeGetUseCase {
  LocalRepository localRepository;

  LikeGetUseCase(this.localRepository);

  Future fetch() async {
    List<String>? entity = await localRepository.getLikeList();
    return entity;
  }
}
