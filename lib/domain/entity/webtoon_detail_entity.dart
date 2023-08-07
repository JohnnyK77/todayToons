import 'package:toonflix/domain/entity/base_entity.dart';

class WebtoonDetailEntity extends BaseEntity {
  WebtoonDetailObj detail;

  WebtoonDetailEntity({
    required this.detail,
    required super.isSuccess,
    required super.message,
  });
}

class WebtoonDetailObj {
  String title;
  String about;
  String genre;
  String age;

  WebtoonDetailObj({
    required this.title,
    required this.about,
    required this.genre,
    required this.age,
  });
}
