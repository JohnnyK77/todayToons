import 'package:toonflix/data/data_source/remote/api_url.dart';
import 'package:toonflix/data/data_source/remote/remote_data_source.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<http.Response> request(
      HttpMethod httpMethod, String path, Map<String, dynamic>? param) async {
    late http.Response res;

    switch (httpMethod) {
      case HttpMethod.get:
        res = await getRequest(path);
        break;
      default:
        break;
    }
    return res;
  }

  Future<http.Response> getRequest(String path) {
    var url = Uri.parse(ApiUrl.baseUrl + path);
    return http.get(url);
  }
}
