import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebToonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 26,
          ),
        ),
      ),
      body: FutureBuilder(
        // FutureBuilder : Future 타입의 값을 받아주는 위젯으로 async 나 await 처리를 직접할 필요 없음
        // 위젯에서 다 해줌 (위젯 안에 있겠지 당연히)
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('There is Data!');
          }
          return const Text('Loading !');
        },
      ),
    );
  }
}
