import 'package:toonflix/domain/repository/local_repository.dart';

class LikeGetUseCase {
  LocalRepository localRepository;

  LikeGetUseCase(this.localRepository);

  Future fetch() async {
    List<String>? entity = await localRepository.getLikeList();
    return entity;
  }
}
