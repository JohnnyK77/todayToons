import 'package:toonflix/domain/entity/base_entity.dart';

class WebtoonEpisodesEntity extends BaseEntity {
  List<EpisodeObj> episodes;

  WebtoonEpisodesEntity({
    required this.episodes,
    required super.isSuccess,
    required super.message,
  });
}

class EpisodeObj {
  String id;
  String title;
  String rating;
  String date;

  EpisodeObj({
    required this.id,
    required this.title,
    required this.rating,
    required this.date,
  });
}
