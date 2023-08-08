import 'package:toonflix/data/data_source/remote/remote_data_source.dart';
import 'package:toonflix/domain/entity/webtoon_detail_entity.dart';
import 'package:toonflix/domain/entity/webtoons_entity.dart';
import 'package:toonflix/domain/entity/webtoon_episodes_entity.dart';

abstract class WebtoonRepository {
  RemoteDataSource remoteDataSource;

  WebtoonRepository(this.remoteDataSource);

  Future<WebtoonsEntity> getTodaysToons();
  Future<WebtoonDetailEntity> getToonById(String id);
  Future<WebtoonEpisodesEntity> getLatestEpisodesById(String id);
}
