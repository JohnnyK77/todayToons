import 'package:toonflix/domain/entity/webtoons_entity.dart';

class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];

  WebtoonObj toEntity() => WebtoonObj(title: title, thumb: thumb, id: id);
}
