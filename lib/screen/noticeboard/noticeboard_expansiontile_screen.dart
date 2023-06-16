import 'package:flutter/material.dart';
import 'package:jigu/model/kategorie_model.dart';

class NoticeboardExpantiontileScreen extends StatefulWidget {
  const NoticeboardExpantiontileScreen({super.key});

  @override
  State<NoticeboardExpantiontileScreen> createState() =>
      _NoticeboardExpantiontileScreenState();
}

class _NoticeboardExpantiontileScreenState
    extends State<NoticeboardExpantiontileScreen> {
  //lib\model\kategorie_model.dart 에서 카테고리 가져오기
  final kmodel = Kategorie().kategorie;

  @override
  Widget build(BuildContext context) {
    //대분류의 개수반환
    return Scaffold(
      appBar: AppBar(title: const Text("연습칸")),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              for (var title in kmodel.keys)
                ExpansionTile(
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: GridView.builder(
                        //index의 값 범위 지정해줌
                        itemCount: kmodel[title]?.length,
                        //높이 지정 에러 방지
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true, //
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 4 / 1,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        //반복적으로 리스트 내 항목만큼 체크박스 만들어냄
                        itemBuilder: (context, index) {
                          return TextButton(
                            //눌렀을 경우 어떻게 될지 정해야함
                            onPressed: () {},
                            child: Text(kmodel[title]![index]),
                          );
                        },
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      )),
    );
  }
}
