import 'package:toonflix/domain/entity/webtoon_episodes_entity.dart';
import 'package:toonflix/domain/repository/webtoon_repository.dart';

///webtoon episode list 조회
class WebtoonEpisodesUseCase {
  WebtoonRepository webtoonRepository;

  WebtoonEpisodesUseCase(this.webtoonRepository);

  ///[id] webtoon id
  Future fetch(String id) async {
    WebtoonEpisodesEntity entity =
        await webtoonRepository.getLatestEpisodesById(id);

    return entity;
  }
}
