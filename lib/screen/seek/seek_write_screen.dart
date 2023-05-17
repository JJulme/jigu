import 'package:flutter/material.dart';

class SeekWriteScreen extends StatefulWidget {
  const SeekWriteScreen({super.key});

  @override
  State<SeekWriteScreen> createState() => _SeekWriteScreenState();
}

enum Range { SELLER, PUBLIC }

class _SeekWriteScreenState extends State<SeekWriteScreen> {
  final bool _isChecked = false;
  Range? _range = Range.SELLER;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드 내리기
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          //타이틀 여백 설정 - 없애버림
          titleSpacing: 0,
          title: const Text("찾아요 글쓰기"),
          actions: [
            //완료 버튼
            ElevatedButton(
              onPressed: () {},
              //버튼 입체감 없애기
              style: ElevatedButton.styleFrom(elevation: 0),
              child: const Text(
                "완료",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text("카테고리")),
                    ElevatedButton(onPressed: () {}, child: const Text("지역설정")),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey, thickness: 1.0),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.black)),
                  child: const Icon(Icons.camera_alt_outlined, size: 35),
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.grey, thickness: 1.0),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "제목",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.all(0),
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(color: Colors.grey, thickness: 1.0),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "찾으시는 제품 또는 서비스의 설명을 작성해주세요.",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.all(0),
                  ),
                  //보여지는 최대 줄길이 설정
                  maxLines: 2,
                  maxLength: 60,
                ),
                const SizedBox(height: 5),
                const Divider(color: Colors.grey, thickness: 1.0),
                const SizedBox(height: 20),
                //질문 범위 정하는 Radio버튼
                RadioListTile(
                  title: const Text("판매자에게 물어보기"),
                  subtitle: const Text("설정에 맞는 판매자들이 답변을 할 수 있습니다."),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  visualDensity:
                      const VisualDensity(vertical: -4, horizontal: -4),
                  value: Range.SELLER,
                  groupValue: _range,
                  onChanged: (rangeValue) {
                    setState(() {
                      _range = rangeValue;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("모두에게 물어보기"),
                  subtitle: const Text("모두에게 물어볼경우 질문이 전체공개 됩니다."),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  visualDensity:
                      const VisualDensity(vertical: -4, horizontal: -4),
                  value: Range.PUBLIC,
                  groupValue: _range,
                  onChanged: (rangeValue) {
                    setState(() {
                      _range = rangeValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
