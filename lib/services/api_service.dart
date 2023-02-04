import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = "today";

  // 비동기를 처리하기 위해서는 async 를 사용하며
  // 요청하는 곳 앞에 await 를 적용
  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return;
    }

    throw Error();
  }
}
