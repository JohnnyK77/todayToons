# toonflix

오늘의 웹툰을 webView로 볼 수 있는 App.

## Architecture

Clean architecture (MVVM with Provider)

[only MVVM with Provider](https://github.com/JohnnyK77/todayToons/tree/4163f73d506386d8c7b38fd1c9007c38028e39b9)

## File tree
📦lib
 ┣ 📂data
 ┃ ┣ 📂data_source
 ┃ ┃ ┣ 📂local
 ┃ ┃ ┃ ┣ 📜local_data_source.dart
 ┃ ┃ ┃ ┗ 📜local_data_source_impl.dart
 ┃ ┃ ┗ 📂remote
 ┃ ┃ ┃ ┣ 📜remote_data_source.dart
 ┃ ┃ ┃ ┗ 📜remote_data_source_impl.dart
 ┃ ┣ 📂model
 ┃ ┃ ┣ 📜webtoon_detail_model.dart
 ┃ ┗ 📂repository
 ┃ ┃ ┣ 📜local_repository_impl.dart
 ┃ ┃ ┗ 📜webtoon_repository_impl.dart
 ┣ 📂domain
 ┃ ┣ 📂entity
 ┃ ┃ ┗ 📜webtoon_episodes_entity.dart
 ┃ ┣ 📂repository
 ┃ ┃ ┣ 📜local_repository.dart
 ┃ ┃ ┗ 📜webtoon_repository.dart
 ┃ ┗ 📂usecase
 ┃ ┃ ┣ 📂webtoon
 ┃ ┃ ┃ ┗ 📜webtoon_today_list_usecase.dart
 ┃ ┃ ┗ 📜like_set_use_case.dart
 ┣ 📂presentation
 ┃ ┣ 📂detail
 ┃ ┃ ┣ 📜detail_view.dart
 ┃ ┃ ┗ 📜detail_view_model.dart
 ┃ ┣ 📂widgets
 ┃ ┣ 📜home_view.dart
 ┃ ┗ 📜home_view_model.dart
 ┣ 📜di_injector.dart
 ┗ 📜main.dart 

---
### data layer
- data_source : 실제 호출되는 데이터
- model : 데이터 호출 시, 파싱에 사용 (like vo)
- repository : domain과 공유하는 실제 구현 클래스 (impl)
---
### domain layer
- entity : 프로젝트 기본 데이터 단위
- repository : data와 공유하는 interface 클래스
- usecase : 비즈니스 로직
---
### presentation layer
- view : page 단위 widget
- view_model : page에 연동되는 viewmodel
- widgets : list, button, dialog 등
---
- main.dart : App.의 start point
- di_injector.dart : impl 클래스 의존성 주입





