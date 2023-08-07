import 'package:toonflix/domain/repository/local_repository.dart';

class LikeSetUseCase {
  LocalRepository localRepository;

  LikeSetUseCase(this.localRepository);

  Future<void> fetch(List<String> list) async {
    await localRepository.setLikeList(list);
  }
}
