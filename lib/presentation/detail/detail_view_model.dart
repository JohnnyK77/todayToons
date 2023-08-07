import 'package:flutter/material.dart';
import 'package:toonflix/data/data_source/remote/remote_data_source_impl.dart';
import 'package:toonflix/data/repository/local_repository_impl.dart';
import 'package:toonflix/data/repository/webtoon_repository_impl.dart';
import 'package:toonflix/domain/entity/webtoon_detail_entity.dart';
import 'package:toonflix/domain/entity/webtoon_episodes_entity.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_detail_usecase.dart';
import 'package:toonflix/domain/usecase/webtoon/webtoon_episodes_usecase.dart';

/// webtoon 상세 페이지 viewmodel
///
/// [id] wetoon id
class DetailViewModel with ChangeNotifier {
  final String id;

  late WebtoonDetailUseCase detailUsecase;
  late WebtoonEpisodesUseCase episodeUsecase;

  late WebtoonRepositoryImpl _webtoonRepository;
  late LocalRepositoryImpl _localRepository;

  WebtoonDetailObj? _webtoonDetail;
  WebtoonDetailObj? get webtoonDetail => _webtoonDetail;

  List<EpisodeObj> _episodes = [];
  List<EpisodeObj> get episodes => _episodes;

  //하트
  bool _isLiked = false;
  bool get isLiked => _isLiked;

  DetailViewModel({required this.id}) {
    _webtoonRepository = WebtoonRepositoryImpl(RemoteDataSourceImpl());
    detailUsecase = WebtoonDetailUseCase(_webtoonRepository);
    episodeUsecase = WebtoonEpisodesUseCase(_webtoonRepository);

    _localRepository = LocalRepositoryImpl();
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
