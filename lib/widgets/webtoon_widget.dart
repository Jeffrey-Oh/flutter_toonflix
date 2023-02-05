import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // GestureDetector - 모든 제스터를 캐치하는 위젯
      onTap: () {
        // Navigator - 네이게이터를 사용히면 애니메이션을 이용하여 새로운 페이지에 온 것 같은 화면을 보여줌
        // 하지만 실제로는 그냥 렌더링을 새로 한 것임
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            // fullscreenDialog - Dialog 화면처럼 보이게 해줘서 아래에서 카드가 올라오며 appBar 에서는 닫기 버튼이 생김
            // 기존은 appBar 에서 뒤로가기 버튼임
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          // Hero - 이미지를 같은 것을 사용하는 느낌을 줄 수 있게 하는 위젯
          // tag 값을 사용하여 연결함
          // 양방향으로 설정해야함
          Hero(
            tag: id,
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
                thumb,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
