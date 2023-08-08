import 'package:toonflix/domain/entity/webtoon_detail_entity.dart';

class WebtoonDetailModel {
  final String title, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];

  WebtoonDetailObj toEntity() =>
      WebtoonDetailObj(title: title, about: about, genre: genre, age: age);
}
