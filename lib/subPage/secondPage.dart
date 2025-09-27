import 'package:flutter/material.dart';

class yCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('2025학년도 1학기 수강신청 안내'),
                  Spacer(),
                  Icon(Icons.star_border, size: 32),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(Icons.delete, size: 32),
                  ),
                ],
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // Row가 차지할 최대 너비
                  final double dashWidth = 4; // 점 하나의 너비
                  final double dashSpace = 2; // 점 사이의 간격
                  final double totalWidth = constraints.constrainWidth();

                  // 전체 너비를 점 하나의 크기 + 간격으로 나누어 총 점의 개수를 계산
                  final int dashCount = (totalWidth / (dashWidth + dashSpace))
                      .floor();

                  return Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // 점들을 균등하게 분배
                    children: List.generate(
                      dashCount,
                      (index) => Container(
                        width: dashWidth,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Text(
                      '📻한림대학교 공지사항',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  Text(
                    '2025학년도 1학기 수강신청이 2월 10일부터 시작됩니다. 수강신청 일정과 유의사항을 확인하세요.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Hallym extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(leading: Icon(Icons.arrow_back)),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return index == 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '한림대학교',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 12,
                          bottom: 4,
                        ),
                        child: Divider(
                          color: Colors.blueAccent,
                          thickness: 1.2,
                        ),
                      ),
                      Container(
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey, width: 2),
                        ),
                        padding: EdgeInsets.all(3),
                        child: Text(
                          "2025-02",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  )
                : yCard();
          },
        ),
      ),
    );
  }
}
