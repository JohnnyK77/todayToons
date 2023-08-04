import 'package:flutter/material.dart';
import 'package:toonflix/data/data_source/remote_data_source.dart';
import 'package:toonflix/data/model/webtoon_model.dart';
import 'package:toonflix/data/repository/webtoon_repository.dart';

///메인페이지 view model
class HomeViewModel with ChangeNotifier {
  late final WebtoonRepository _repository;

  List<WebtoonModel> _webtoons = [];
  List<WebtoonModel> get webtoons => _webtoons;

  HomeViewModel() {
    _repository = WebtoonRepository(RemoteDataSource());
    _getTodayToons();
  }

  Future<void> _getTodayToons() async {
    _webtoons = await _repository.getTodaysToons();
    notifyListeners();
  }
}
