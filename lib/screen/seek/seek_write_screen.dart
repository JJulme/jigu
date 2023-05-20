import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SeekWriteScreen extends StatefulWidget {
  const SeekWriteScreen({super.key});

  @override
  State<SeekWriteScreen> createState() => _SeekWriteScreenState();
}

//Radio 버튼을 위해 판매자, 전체공개 구분 enum 생성
enum Range { seller, public }

class _SeekWriteScreenState extends State<SeekWriteScreen> {
  //갤러리 이미지 불러오기
  //ImagePicker 초기화
  final ImagePicker _picker = ImagePicker();
  //이미지들 담을 빈 리스트 선언
  final List<XFile?> _pickedimgs = [];
  //누르면 갤러리 열리는 함수 생성
  void getImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    setState(() {
      _pickedimgs.addAll(images);
    });
  }

  //초기 판매자 Radio 버튼으로 설정됨
  Range? _range = Range.seller;
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
                //ListView를 감싸 에러 방지
                SizedBox(
                  height: 95,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      //이미지 추가 버튼
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.grey),
                            //내부 여백으로 크기 설정
                            padding: const EdgeInsets.all(30),
                            //테두리 둥글게 설정
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () => getImages(),
                        child: const Icon(Icons.add_a_photo_outlined, size: 35),
                      ),
                      Container(
                        width: 95,
                        color: Colors.amber,
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      ),
                      Container(
                        width: 95,
                        color: Colors.red,
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      ),
                      Container(
                        width: 95,
                        color: Colors.blue,
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.grey, thickness: 1.0),
                const SizedBox(height: 20),
                //제목을 적는 TextField
                const TextField(
                  decoration: InputDecoration(
                    hintText: "제목",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.all(0),
                  ),
                  maxLength: 40,
                ),
                const SizedBox(height: 5),
                const Divider(color: Colors.grey, thickness: 1.0),
                const SizedBox(height: 20),
                //상세내용이 적히는 TextField
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
                  //여백 설정
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  //내부 버튼과 텍스트 여백 설정: -4~4
                  visualDensity:
                      const VisualDensity(vertical: -4, horizontal: -4),
                  value: Range.seller,
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
                  //여백 설정
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  //내부 버튼과 텍스트 여백 설정: -4~4
                  visualDensity:
                      const VisualDensity(vertical: -4, horizontal: -4),
                  value: Range.public,
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
