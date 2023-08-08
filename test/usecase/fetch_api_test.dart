import 'package:flutter_test/flutter_test.dart';
import 'package:toonflix/data/data_source/remote/remote_data_source_impl.dart';
import 'package:toonflix/data/repository/webtoon_repository_impl.dart';
import 'package:toonflix/domain/entity/webtoon_detail_entity.dart';
import 'package:toonflix/domain/entity/webtoon_episodes_entity.dart';
import 'package:toonflix/domain/entity/webtoons_entity.dart';
import 'package:toonflix/domain/repository/webtoon_repository.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_detail_usecase.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_episodes_usecase.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_today_list_usecase.dart';

void main() {
  var webtoonId = '796152';
  late WebtoonRepository webtoonRepository;

  setUp(() {
    webtoonRepository = WebtoonRepositoryImpl(RemoteDataSourceImpl());
  });

  group('fetch api', () {
    test('returns today Webtoon list if the http call completes successfully',
        () async {
      var usecase = WebtoonTodayListUsecase(webtoonRepository);
      WebtoonsEntity entity = await usecase.fetch();
      expect(entity.webtoons.length, 46);
    });
    test('returns Webtoon detail if the http call completes successfully',
        () async {
      var usecase = WebtoonDetailUseCase(webtoonRepository);
      WebtoonDetailEntity entity = await usecase.fetch(webtoonId);
      var resultAge = entity.detail.age;
      expect(resultAge, '전체연령가');
    });
    test('returns Webtoon episode list if the http call completes successfully',
        () async {
      var usecase = WebtoonEpisodesUseCase(webtoonRepository);
      WebtoonEpisodesEntity entity = await usecase.fetch(webtoonId);
      expect(entity.episodes.length, 29);
    });
  });
}
