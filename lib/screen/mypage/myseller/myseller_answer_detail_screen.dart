import 'package:flutter/material.dart';

class MysellerAnswerDetailScreen extends StatefulWidget {
  const MysellerAnswerDetailScreen({super.key});

  @override
  State<MysellerAnswerDetailScreen> createState() =>
      _MysellerAnswerDetailScreenState();
}

class _MysellerAnswerDetailScreenState
    extends State<MysellerAnswerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("찾는글 제목"),
        actions: [
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                "답변삭제",
                style: TextStyle(fontSize: 18),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "찾는 글 제목",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
                height: 40,
              ),
              const Text(
                "미안하다 이거 보여주려고 어그로끌었다.. 나루토 사스케 싸움수준 ㄹㅇ실화냐? 진짜 세계관최강자들의 싸움이다.. 그찐따같던 나루토가 맞나? 진짜 나루토는 전설이다..진짜옛날에 맨날나루토봘는데 왕같은존재인 호카게 되서 세계최강 전설적인 영웅이된나루토보면 진짜내가다 감격스럽고 나루토 노래부터 명장면까지 가슴울리는장면들이 뇌리에 스치면서 가슴이 웅장해진다..",
                style: TextStyle(fontSize: 25),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
                height: 40,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                    width: 100,
                    height: 100,
                    color: Colors.indigo[200],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                    width: 100,
                    height: 100,
                    color: Colors.indigo[200],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                    width: 100,
                    height: 100,
                    color: Colors.indigo[200],
                  ),
                ],
              ),
              const Text(
                "저도 나루토 사스케의 싸움을 보았습니다. 정말 가슴을 불태우는 싸움이었습니다. 하지만 후속작인 보루토와 광호군의 혈투는 정말 눈물없이 볼 수 없는 장면이었습니다.",
                style: TextStyle(fontSize: 23),
              )
            ],
          ),
        ),
      ),
    );
  }
}
