import 'dart:convert';

import 'package:toonflix/data/data_source/remote/api_url.dart';
import 'package:toonflix/data/data_source/remote/remote_data_source.dart';
import 'package:toonflix/data/model/webtoon_detail_model.dart';
import 'package:toonflix/data/model/webtoon_episode_model.dart';
import 'package:toonflix/data/model/webtoon_model.dart';
import 'package:toonflix/domain/entity/webtoon_detail_entity.dart';
import 'package:toonflix/domain/entity/webtoons_entity.dart';
import 'package:toonflix/domain/entity/webtoon_episodes_entity.dart';
import 'package:toonflix/domain/repository/webtoon_repository.dart';

class WebtoonRepositoryImpl implements WebtoonRepository {
  @override
  RemoteDataSource remoteDataSource;

  WebtoonRepositoryImpl(this.remoteDataSource);

  @override
  Future<WebtoonsEntity> getTodaysToons() async {
    var response =
        await remoteDataSource.request(HttpMethod.get, ApiUrl.today, null);
    List<WebtoonObj> webtoons = [];
    final List<dynamic> datas = jsonDecode(response.body);
    for (var data in datas) {
      var model = WebtoonModel.fromJson(data);
      webtoons.add(
          WebtoonObj(title: model.title, thumb: model.thumb, id: model.id));
    }

    return WebtoonsEntity(
      webtoons: webtoons,
      isSuccess: response.statusCode == 200,
      message: response.reasonPhrase ?? "",
    );
  }

  @override
  Future<WebtoonDetailEntity> getToonById(String id) async {
    final response = await remoteDataSource.request(
        HttpMethod.get, ApiUrl().detail(id), null);
    final dynamic webtoon = jsonDecode(response.body);
    var model = WebtoonDetailModel.fromJson(webtoon);

    return WebtoonDetailEntity(
      detail: WebtoonDetailObj(
        title: model.title,
        about: model.about,
        genre: model.genre,
        age: model.age,
      ),
      isSuccess: response.statusCode == 200,
      message: response.reasonPhrase ?? "",
    );
  }

  @override
  Future<WebtoonEpisodesEntity> getLatestEpisodesById(String id) async {
    final response = await remoteDataSource.request(
        HttpMethod.get, ApiUrl().episodes(id), null);
    final List<dynamic> datas = jsonDecode(response.body);
    List<EpisodeObj> episodes = [];
    for (var data in datas) {
      var model = WebtoonEpisodeModel.fromJson(data);
      if (model.id.isNotEmpty) {
        var idVal = int.parse(model.id);
        idVal++;
        model.id = idVal.toString();
        episodes.add(EpisodeObj(
          id: model.id,
          title: model.title,
          rating: model.rating,
          date: model.date,
        ));
      }
    }
    return WebtoonEpisodesEntity(
      episodes: episodes,
      isSuccess: response.statusCode == 200,
      message: response.reasonPhrase ?? "",
    );
  }
}
