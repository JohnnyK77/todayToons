import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/repositories/webtoon_repository.dart';

///메인페이지 view model
class HomeViewModel with ChangeNotifier {
  late final WebtoonRepository _repository;

  List<WebtoonModel> _webtoons = [];
  List<WebtoonModel> get webtoons => _webtoons;

  HomeViewModel() {
    _repository = WebtoonRepository();
    _getTodayToons();
  }

  Future<void> _getTodayToons() async {
    _webtoons = await _repository.getTodaysToons();
    notifyListeners();
  }
}
