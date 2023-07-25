import 'package:flutter/material.dart';

class SeekDetailScreen extends StatefulWidget {
  const SeekDetailScreen({super.key});

  @override
  State<SeekDetailScreen> createState() => _SeekDetailScreenState();
}

class _SeekDetailScreenState extends State<SeekDetailScreen> {
  bool writeAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        //더보기 버튼
        PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(child: Text("차단하기")),
            const PopupMenuItem(child: Text("신고하기"))
          ],
        )
      ]),
      body: GestureDetector(
        //키보드 내리기
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //글쓴이 정보
                        Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(child: Text("프사")),
                            ),
                            const SizedBox(width: 15),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("닉네임",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 10),
                                Text("부산 수영구 광안리")
                              ],
                            )
                          ],
                        ),
                        //질문자가 올린 사진
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              color: Colors.grey,
                              child: const Center(child: Text("사진")),
                            ),
                            Container(
                              height: 120,
                              width: 120,
                              color: Colors.grey,
                              child: const Center(child: Text("사진")),
                            ),
                            Container(
                              height: 120,
                              width: 120,
                              color: Colors.grey,
                              child: const Center(child: Text("사진")),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "긁어서 확인하는 복권 100만원어치 사고 싶습니다.",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "마트/편의점  <전체에게 질문>",
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "미안하다 이거 보여주려고 어그로끌었다.. 나루토 사스케 싸움수준 ㄹㅇ실화냐? 진짜 세계관최강자들의 싸움이다.. 그찐따같던 나루토가 맞나? 진짜 나루토는 전설이다..진짜옛날에 맨날나루토봘는데 왕같은존재인 호카게 되서 세계최강 전설적인 영웅이된나루토보면 진짜내가다 감격스럽고 나루토 노래부터 명장면까지 가슴울리는장면들이 뇌리에 스치면서 가슴이 웅장해진다..",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              //https://steemit.com/kr/@anpigon/flutter
              //화면 아래 고정, 키보드의 위에 배치됨
              inputAnswer(),
            ],
          ),
        ),
      ),
    );
  }

  //부울값에 따라 텍스트 입력창이 바뀜
  bool onTapField = false;
  //텍스트 입력 확인을 위한 컨트롤러
  final TextEditingController _controller = TextEditingController();
  Widget inputAnswer() {
    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                onTapField ? textFieldLarge() : textFieldSmall(),
                onTapField
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                  Icons.add_photo_alternate_rounded)),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("게시"))
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldSmall() {
    return TextField(
      //입력값 받는 변수
      controller: _controller,
      //입력받는 길이 설정
      maxLength: 80,
      decoration: const InputDecoration(
        //입력전 보여지는 설명
        hintText: "답변을 입력해주세요.",
        //테두리 설정
        border: OutlineInputBorder(),
        //내부여백 설정
        contentPadding: EdgeInsets.all(10),
        //maxLength 안보이게 설정
        counterText: "",
      ),
      //TextField를 눌렀을 때
      onTap: () {
        setState(() {
          onTapField = !onTapField;
        });
      },
    );
  }

  Widget textFieldLarge() {
    return TextField(
      //입력값 받는 변수
      controller: _controller,
      //입력받는 길이 설정
      maxLength: 80,
      //길이 설정
      maxLines: 5,
      decoration: const InputDecoration(
        //입력전 보여지는 설명
        hintText: "답변을 입력해주세요.",
        //테두리 설정
        border: OutlineInputBorder(),
        //내부여백 설정
        contentPadding: EdgeInsets.all(10),
      ),
      //TextField 이외의 곳을 눌렀을 때
      onTapOutside: (event) {
        //텍스트 입력된것이 없을 경우
        if (_controller.text.isEmpty) {
          setState(() {
            onTapField = !onTapField;
          });
        }
      },
    );
  }
}
