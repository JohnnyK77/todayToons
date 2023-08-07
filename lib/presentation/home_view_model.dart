import 'package:flutter/material.dart';
import 'package:toonflix/data/data_source/remote/remote_data_source_impl.dart';
import 'package:toonflix/data/repository/webtoon_repository_impl.dart';
import 'package:toonflix/domain/entity/webtoons_entity.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_today_list_usecase.dart';

///메인페이지 view model
class HomeViewModel with ChangeNotifier {
  late WebtoonTodayListUsecase usecase;

  List<WebtoonObj> _webtoons = [];
  List<WebtoonObj> get webtoons => _webtoons;

  HomeViewModel() {
    usecase =
        WebtoonTodayListUsecase(WebtoonRepositoryImpl(RemoteDataSourceImpl()));
    _getTodayToons();
  }

  Future<void> _getTodayToons() async {
    WebtoonsEntity entity = await usecase.fetch();
    if (entity.isSuccess) {
      _webtoons = entity.webtoons;
      notifyListeners();
    }
  }
}
