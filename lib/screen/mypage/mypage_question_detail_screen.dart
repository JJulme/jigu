import 'package:flutter/material.dart';

class MypageQuestionDetailScreen extends StatefulWidget {
  const MypageQuestionDetailScreen({super.key});

  @override
  State<MypageQuestionDetailScreen> createState() =>
      _MypageQuestionDetailScreenState();
}

class _MypageQuestionDetailScreenState
    extends State<MypageQuestionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("찾는글 제목"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  ),
                ],
              ),
              const Text(
                "긁어서 확인하는 복권 100만원어치 사고 싶습니다.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const Text(
                "마트/편의점  <전체에게 질문>",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 10),
              const Text(
                "미안하다 이거 보여주려고 어그로끌었다.. 나루토 사스케 싸움수준 ㄹㅇ실화냐? 진짜 세계관최강자들의 싸움이다.. 그찐따같던 나루토가 맞나? 진짜 나루토는 전설이다..진짜옛날에 맨날나루토봘는데 왕같은존재인 호카게 되서 세계최강 전설적인 영웅이된나루토보면 진짜내가다 감격스럽고 나루토 노래부터 명장면까지 가슴울리는장면들이 뇌리에 스치면서 가슴이 웅장해진다..",
                style: TextStyle(fontSize: 25),
              ),
              const Divider(
                height: 40,
                thickness: 2,
                color: Colors.grey,
              ),
              answer(
                35,
                "갈매기조련사",
                "안녕하세요 답변 드리겠습니다.\n\n일단 저도 복권을 좋아합니다. 친구들과 나루토 사스케가 싸우면 누가 이길지 내기를 걸고 각자 나루토 사스케를 맡고 맞짱을 깠습니다. 물론 저는 이타치를 맡고 까마귀로 변신해서 도망갔습니다. 그래서 이렇게 살아남았습니다.",
              ),
              answer(
                15,
                "현지니네 편의점",
                "안녕하세요, 현지니네 편의점 입니다.\n저희 편의점에서 복권을 판매하고 있습니다. 100만원 어치를 구매하시려면 그림자 분신술 10명을 하셔서 구매 가능합니다. \n감사합니다.",
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget answer(double circle, String name, String answer) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(circle)),
                  color: Colors.grey,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "해운대구 해운대동",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          Text(
            answer,
            style: const TextStyle(fontSize: 18),
          ),
          const Divider(
            thickness: 20,
            height: 50,
          ),
        ],
      ),
    );
  }
}
