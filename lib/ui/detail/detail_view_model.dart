import 'package:flutter/material.dart';
import 'package:toonflix/data/model/webtoon_detail_model.dart';
import 'package:toonflix/data/model/webtoon_episode_model.dart';
import 'package:toonflix/data/repository/local_repository.dart';
import 'package:toonflix/data/repository/webtoon_repository.dart';

/// webtoon 상세 페이지 viewmodel
///
/// [id] wetoon id
class DetailViewModel with ChangeNotifier {
  final String id;

  late final WebtoonRepository _webtoonRepository;
  late final LocalRepository _localRepository;

  WebtoonDetailModel? _webtoonDetail;
  WebtoonDetailModel? get webtoonDetail => _webtoonDetail;

  List<WebtoonEpisodeModel> _episodes = [];
  List<WebtoonEpisodeModel> get episodes => _episodes;

  //하트
  bool _isLiked = false;
  bool get isLiked => _isLiked;

  DetailViewModel({required this.id}) {
    _webtoonRepository = WebtoonRepository();
    _localRepository = LocalRepository();
    _getToonById(id);
    _getLatestEpisodesById(id);
    _getLiked();
  }

  Future<void> _getToonById(String id) async {
    _webtoonDetail = await _webtoonRepository.getToonById(id);
    notifyListeners();
  }

  Future<void> _getLatestEpisodesById(String id) async {
    _episodes = await _webtoonRepository.getLatestEpisodesById(id);
    notifyListeners();
  }

  Future<void> _getLiked() async {
    final likedToons = await _localRepository.getLikeList();
    if (likedToons != null) {
      if (likedToons.contains(id)) {
        _isLiked = true;
        notifyListeners();
      }
    } else {
      _localRepository.setLikeList([]);
    }
  }

  void onFavoritePressed() async {
    final likedToons = await _localRepository.getLikeList();
    if (likedToons != null) {
      if (_isLiked) {
        likedToons.remove(id);
      } else {
        likedToons.add(id);
      }
      _localRepository.setLikeList(likedToons);
      _isLiked = !_isLiked;
      notifyListeners();
    }
  }
}
