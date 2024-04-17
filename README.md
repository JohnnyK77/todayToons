# toonflix

오늘의 웹툰을 webView로 볼 수 있는 App.

![Screen_Recording_20240416-175216](https://github.com/JohnnyK77/todayToons/assets/118873509/49dffb9c-cf95-4cc2-a33d-1fb81fa71aef)

## Architecture

Clean architecture (MVVM with Provider)

[only MVVM with Provider](https://github.com/JohnnyK77/todayToons/tree/4163f73d506386d8c7b38fd1c9007c38028e39b9)

## File tree
![image](https://github.com/JohnnyK77/todayToons/assets/118873509/2edf8dac-30c4-4ae5-8c9f-4349f977709b)

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





