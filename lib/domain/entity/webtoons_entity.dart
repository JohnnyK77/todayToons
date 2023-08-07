import 'package:toonflix/domain/entity/base_entity.dart';

class WebtoonsEntity extends BaseEntity {
  List<WebtoonObj> webtoons;

  WebtoonsEntity({
    required this.webtoons,
    required super.isSuccess,
    required super.message,
  });
}

class WebtoonObj {
  String title;
  String thumb;
  String id;

  WebtoonObj({
    required this.title,
    required this.thumb,
    required this.id,
  });
}
