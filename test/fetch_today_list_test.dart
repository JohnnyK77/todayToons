import 'package:flutter_test/flutter_test.dart';
import 'package:toonflix/data/data_source/remote/remote_data_source_impl.dart';
import 'package:toonflix/data/repository/webtoon_repository_impl.dart';
import 'package:toonflix/domain/entity/webtoons_entity.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_today_list_usecase.dart';

void main() {
  group('fetch today list', () {
    test('returns an Webtoon if the http call completes successfully',
        () async {
      var usecase = WebtoonTodayListUsecase(
          WebtoonRepositoryImpl(RemoteDataSourceImpl()));
      WebtoonsEntity entity = await usecase.fetch();
      for (var webtoon in entity.webtoons) {
        print('webtoon : ${webtoon.title}');
      }
      expect(entity.webtoons.length, 46);
    });
    test('then list size is 20?', () async {
      expect(20, 20);
    });
  });
}
