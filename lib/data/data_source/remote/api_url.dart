class ApiUrl {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  //paths
  static const String today = "/today";
  String detail(String id) => "/$id";
  String episodes(String id) => "/$id/episodes";
}
