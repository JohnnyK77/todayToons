import 'package:toonflix/data/data_source/remote_data_source.dart';
import 'package:toonflix/data/locator.dart';
import 'package:toonflix/data/model/webtoon_detail_model.dart';
import 'package:toonflix/data/model/webtoon_episode_model.dart';
import 'package:toonflix/data/model/webtoon_model.dart';

class WebtoonRepository {
  final RemoteDataSource _remoteDataSource = locator.get<RemoteDataSource>();

  Future<List<WebtoonModel>> getTodaysToons() {
    return _remoteDataSource.getTodaysToons();
  }

  Future<WebtoonDetailModel> getToonById(String id) {
    return _remoteDataSource.getToonById(id);
  }

  Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(String id) {
    return _remoteDataSource.getLatestEpisodesById(id);
  }
}
