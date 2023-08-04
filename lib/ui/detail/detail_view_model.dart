import 'package:flutter/material.dart';
import 'package:toonflix/data/data_source/prefs_data_source.dart';
import 'package:toonflix/data/data_source/remote_data_source.dart';
import 'package:toonflix/data/model/webtoon_detail_model.dart';
import 'package:toonflix/data/model/webtoon_episode_model.dart';
import 'package:toonflix/data/repository/webtoon_repository.dart';

/// webtoon 상세 페이지 viewmodel
///
/// [prefs] sharedpreference instance
/// [id] wetoon id
class DetailViewModel with ChangeNotifier {
  final String id;
  final PrefsDataSource prefs;

  late final WebtoonRepository _repository;

  WebtoonDetailModel? _webtoonDetail;
  WebtoonDetailModel? get webtoonDetail => _webtoonDetail;

  List<WebtoonEpisodeModel> _episodes = [];
  List<WebtoonEpisodeModel> get episodes => _episodes;

  //하트
  bool _isLiked = false;
  bool get isLiked => _isLiked;

  DetailViewModel({required this.id, required this.prefs}) {
    _repository = WebtoonRepository(RemoteDataSource());
    _getToonById(id);
    _getLatestEpisodesById(id);
    _getLiked();
  }

  Future<void> _getToonById(String id) async {
    _webtoonDetail = await _repository.getToonById(id);
    notifyListeners();
  }

  Future<void> _getLatestEpisodesById(String id) async {
    _episodes = await _repository.getLatestEpisodesById(id);
    notifyListeners();
  }

  Future<void> _getLiked() async {
    final likedToons = await prefs.getStringList(prefs.keyLikedToons);
    if (likedToons != null) {
      if (likedToons.contains(id)) {
        _isLiked = true;
        notifyListeners();
      }
    } else {
      prefs.setStringList(prefs.keyLikedToons, []);
    }
  }

  void onFavoritePressed() async {
    final likedToons = await prefs.getStringList(prefs.keyLikedToons);
    if (likedToons != null) {
      if (_isLiked) {
        likedToons.remove(id);
      } else {
        likedToons.add(id);
      }
      prefs.setStringList(prefs.keyLikedToons, likedToons);
      _isLiked = !_isLiked;
      notifyListeners();
    }
  }
}
