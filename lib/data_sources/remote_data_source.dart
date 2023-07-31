import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class RemoteDataSource {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";
  final String episodes = "episodes";

  //오늘의 webtoon list 조회
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstance = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstance.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstance;
    }
    throw Error();
  }

  ///webtoon 상세 조회
  ///
  ///[id] webtoon id
  Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  ///webtoon episode list 조회
  ///
  ///[id] webtoon id
  Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(String id) async {
    List<WebtoonEpisodeModel> eplisodesInstance = [];
    final url = Uri.parse('$baseUrl/$id/$episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        var vo = WebtoonEpisodeModel.fromJson(episode);
        if (vo.id.isNotEmpty) {
          var idVal = int.parse(vo.id);
          idVal++;
          vo.id = idVal.toString();
          eplisodesInstance.add(vo);
        }
      }
      return eplisodesInstance;
    }
    throw Error();
  }
}
