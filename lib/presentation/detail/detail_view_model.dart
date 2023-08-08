import 'package:flutter/material.dart';
import 'package:toonflix/di_injector.dart';
import 'package:toonflix/domain/entity/webtoon_detail_entity.dart';
import 'package:toonflix/domain/entity/webtoon_episodes_entity.dart';
import 'package:toonflix/domain/usecase/like_get_use_case.dart';
import 'package:toonflix/domain/usecase/like_set_use_case.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_detail_usecase.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_episodes_usecase.dart';

/// webtoon 상세 페이지 viewmodel
///
/// [id] wetoon id
class DetailViewModel with ChangeNotifier {
  final String id;
  // usecase
  late WebtoonDetailUseCase detailUsecase;
  late WebtoonEpisodesUseCase episodeUsecase;
  late LikeGetUseCase likeGetUsecase;
  late LikeSetUseCase likeSetUsecase;

  // view와 공유하는 변수
  WebtoonDetailObj? _webtoonDetail;
  WebtoonDetailObj? get webtoonDetail => _webtoonDetail;

  List<EpisodeObj> _episodes = [];
  List<EpisodeObj> get episodes => _episodes;

  bool _isLiked = false;
  bool get isLiked => _isLiked;

  DetailViewModel({required this.id}) {
    detailUsecase = locator.get<WebtoonDetailUseCase>();
    episodeUsecase = locator.get<WebtoonEpisodesUseCase>();

    likeGetUsecase = locator.get<LikeGetUseCase>();
    likeSetUsecase = locator.get<LikeSetUseCase>();

    _getToonById(id);
    _getLatestEpisodesById(id);
    _getLiked();
  }

  Future<void> _getToonById(String id) async {
    WebtoonDetailEntity entity = await detailUsecase.fetch(id);
    if (entity.isSuccess) {
      _webtoonDetail = entity.detail;
      notifyListeners();
    }
  }

  Future<void> _getLatestEpisodesById(String id) async {
    WebtoonEpisodesEntity entity = await episodeUsecase.fetch(id);
    if (entity.isSuccess) {
      _episodes = entity.episodes;
      notifyListeners();
    }
  }

  Future<void> _getLiked() async {
    final likedToons = await likeGetUsecase.fetch();
    if (likedToons != null) {
      if (likedToons.contains(id)) {
        _isLiked = true;
        notifyListeners();
      }
    } else {
      likeSetUsecase.fetch([]);
    }
  }

  void onFavoritePressed() async {
    final likedToons = await likeGetUsecase.fetch();
    if (likedToons != null) {
      if (_isLiked) {
        likedToons.remove(id);
      } else {
        likedToons.add(id);
      }
      likeSetUsecase.fetch(likedToons);
      _isLiked = !_isLiked;
      notifyListeners();
    }
  }
}
