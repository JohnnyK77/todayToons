import 'package:toonflix/domain/entity/webtoon_episodes_entity.dart';

class WebtoonEpisodeModel {
  String id;
  final String title, rating, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];

  EpisodeObj toEntity() =>
      EpisodeObj(id: id, title: title, rating: rating, date: date);
}
