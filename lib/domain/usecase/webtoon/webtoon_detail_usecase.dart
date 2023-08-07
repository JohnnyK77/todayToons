import 'package:toonflix/domain/entity/webtoon_detail_entity.dart';
import 'package:toonflix/domain/repository/webtoon_repository.dart';

///webtoon 상세 조회
class WebtoonDetailUseCase {
  WebtoonRepository webtoonRepository;

  WebtoonDetailUseCase(this.webtoonRepository);

  ///[id] webtoon id
  Future fetch(String id) async {
    WebtoonDetailEntity entity = await webtoonRepository.getToonById(id);
    return entity;
  }
}
