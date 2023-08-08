import 'package:flutter/material.dart';
import 'package:toonflix/di_injector.dart';
import 'package:toonflix/domain/entity/webtoons_entity.dart';
import 'package:toonflix/domain/repository/webtoon_repository.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_today_list_usecase.dart';

///메인페이지 view model
class HomeViewModel with ChangeNotifier {
  late WebtoonTodayListUsecase webtoonTodayListUsecase;

  List<WebtoonObj> _webtoons = [];
  List<WebtoonObj> get webtoons => _webtoons;

  HomeViewModel() {
    var webtoonRepository = locator.get<WebtoonRepository>();
    webtoonTodayListUsecase = WebtoonTodayListUsecase(webtoonRepository);
    _getTodayToons();
  }

  Future<void> _getTodayToons() async {
    WebtoonsEntity entity = await webtoonTodayListUsecase.fetch();
    if (entity.isSuccess) {
      _webtoons = entity.webtoons;
      notifyListeners();
    }
  }
}
