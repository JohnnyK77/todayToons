import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toonflix/presentation/home_view_model.dart';
import 'package:toonflix/presentation/widgets/webtoon_widget.dart';
import 'package:toonflix/domain/entity/webtoons_entity.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "오늘의 웹툰",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.primary,
          elevation: 2,
          centerTitle: true,
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, provider, child) {
            final webtoons = provider.webtoons;
            if (webtoons.isNotEmpty) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(child: makeList(context, webtoons)),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  ListView makeList(BuildContext context, List<WebtoonObj> wetoons) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: wetoons.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemBuilder: (context, index) {
        var webtoon = wetoons[index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
