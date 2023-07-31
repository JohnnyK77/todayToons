import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toonflix/data_sources/prefs_data_source.dart';
import 'package:toonflix/view_models/detail_view_model.dart';
import 'package:toonflix/widgets/episode_widget.dart';

/// webtoon 상세 페이지
///
/// [title] 제목
/// [thumb] thumbnail img url
/// [id] wetoon id
class DetailView extends StatelessWidget {
  final String title, thumb, id;

  const DetailView({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailViewModel(id: id, prefs: PrefsDataSource()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.primary,
          elevation: 2,
          centerTitle: true,
          actions: [
            Consumer<DetailViewModel>(
              builder: (context, provider, child) {
                return IconButton(
                  onPressed: () => provider.onFavoritePressed(),
                  icon: Icon(
                    provider.isLiked
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined,
                  ),
                );
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              offset: const Offset(10, 10),
                              color: Colors.black.withOpacity(0.3),
                            )
                          ]),
                      child: Image.network(
                        thumb,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Consumer<DetailViewModel>(
                builder: (context, provider, child) {
                  final webtoon = provider.webtoonDetail;
                  if (webtoon != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          webtoon.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${webtoon.genre} / ${webtoon.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text('......');
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Consumer<DetailViewModel>(
                builder: (context, provider, child) {
                  final episodes = provider.episodes;
                  if (episodes.isNotEmpty) {
                    return Column(
                      children: [
                        for (var episode in episodes)
                          Episode(episode: episode, webtoonId: id)
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
