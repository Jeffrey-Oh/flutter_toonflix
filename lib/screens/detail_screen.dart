import 'package:flutter/material.dart';
import 'package:toonflix/widgets/common_scaffold.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: title,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            ],
          )
        ],
      ),
    );
  }
}
