import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/common_scaffold.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebToonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: '오늘의 웹툰',
      body: FutureBuilder(
        // FutureBuilder : Future 타입의 값을 받아주는 위젯으로 async 나 await 처리를 직접할 필요 없음
        // 위젯에서 다 해줌 (위젯 안에 있겠지 당연히)
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ListView - 기본 리스트뷰 (한번에 리스트를 전부 로딩함)
            // ListView.builder - 좀 더 개선된 리스트뷰 (한번에 로딩하지 않고 필요한 만큼만 로딩함)
            // ListView.separated - 구분 값 추가된 리스트뷰
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebToonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
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
