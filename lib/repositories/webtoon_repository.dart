import 'package:toonflix/data_sources/remote_data_source.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class WebtoonRepository {
  final _remoteDataSource = RemoteDataSource();

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
