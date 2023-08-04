import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toonflix/data/locator.dart';
import 'package:toonflix/ui/home_view.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  initLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.white,
          primarySwatch: Colors.green,
        ),
      ),
      home: const HomeView(),
    );
  }
}

/// Naver Webtoon User-agent 적용
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}
