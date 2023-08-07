import 'package:toonflix/domain/entity/webtoons_entity.dart';
import 'package:toonflix/domain/repository/webtoon_repository.dart';

//오늘의 webtoon list 조회
class WebtoonTodayListUsecase {
  WebtoonRepository webtoonRepository;

  WebtoonTodayListUsecase(this.webtoonRepository);

  Future fetch() async {
    WebtoonsEntity entity = await webtoonRepository.getTodaysToons();
    return entity;
  }
}
