import 'package:flutter/material.dart';
import 'package:toonflix/data/model/webtoon_episode_model.dart';
import 'package:toonflix/domain/entity/webtoon_episodes_entity.dart';
import 'package:url_launcher/url_launcher_string.dart';

///webtoon episode(ex: 124화)
///
///[episode] - [WebtoonEpisodeModel]
///[webtoonId] webtoon id
class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });
  final String webtoonId;
  final EpisodeObj episode;

  void onButtonTap() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green.shade400,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(3, 3),
                color: Colors.black.withOpacity(0.2),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  episode.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
