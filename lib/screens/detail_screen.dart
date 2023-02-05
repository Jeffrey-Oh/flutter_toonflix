import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/common_scaffold.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // widget - 자기 자신을 가리키는 StatefulWidget Class 를 뜻함
  // 여기서는 DetailScreen
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    // StatefulWidget 의 State 값을 사용하기 위해서는 widget 으로 접근해야하며 전역변수에서 바로 사용이 불가능
    // 따라서 initState 에서 접근이 가능하다
    super.initState();

    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getEpisodeById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: widget.title,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
                child: Container(
                  // clipBehavior - 자식이 부모의 영역에 침범 하게 하는 것
                  clipBehavior: Clip.hardEdge,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          offset: const Offset(10, 10),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]),
                  child: Image.network(
                    // 외부에서 주소값으로 이미지 불러오기
                    widget.thumb,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
