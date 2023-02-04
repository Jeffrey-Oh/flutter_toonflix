import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = "today";

  // 비동기를 처리하기 위해서는 async 를 사용하며
  // 요청하는 곳 앞에 await 를 적용
  Future<List<WebToonModel>> getTodaysToons() async {
    List<WebToonModel> webToonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webToonInstances.add(WebToonModel.fromjson(webtoon));
      }
      return webToonInstances;
    }

    throw Error();
  }
}
