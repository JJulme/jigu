import 'dart:io';

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
  //갤러리 이미지 여러개 불러오기 - https://dalgoodori.tistory.com/38
  //ImagePicker 초기화
  final ImagePicker _picker = ImagePicker();
  //이미지들 담을 빈 리스트 선언
  List<XFile>? _pickedimgs;
  //누르면 갤러리 열리는 함수 생성
  void getImages() async {
    try {
      List<XFile>? images = await _picker.pickMultiImage();
      setState(() {
        if (images.isNotEmpty) {
          _pickedimgs = images;
        } else {
          print("선택된 사진이 없습니다.");
        }
      });
    } catch (e) {
      print("이미지를 가져오는데 오류발생");
    }
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
                  height: 105,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      //이미지 추가 버튼 - 버튼 크기 설정과 마진설정을 위해 Container 사용
                      Container(
                        height: 95,
                        width: 95,
                        margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.grey),
                              //테두리 둥글게 설정
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () => getImages(),
                          child:
                              const Icon(Icons.add_a_photo_outlined, size: 35),
                        ),
                      ),
                      //선택한 이미지가 있다면 표시
                      imageContainer()
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

  //선택한 이미지가 보여지는 Container
  Widget imageContainer() {
    return _pickedimgs != null
        ? Wrap(
            children: _pickedimgs!.map((img) {
              //Stack 컨터이너 박스에 항목 삭제 버튼 겹치기 위해
              return Stack(
                children: <Widget>[
                  Container(
                    height: 95,
                    width: 95,
                    //불러온 이미지 왼쪽으로 15만큼 간격주기
                    margin: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                    //컨테이너 모서리 둥글게 하고 이미지가 넘치지 않게 설정
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    //이미지 불러오고 컨테이너에 꽉차게 채우기
                    child: Image.file(File(img.path), fit: BoxFit.cover),
                  ),
                  Positioned(
                      top: -11,
                      right: -11,
                      child: IconButton(
                        //버튼을 누르면 해상 사진 선택목록에서 삭제
                        onPressed: () {
                          setState(() {
                            _pickedimgs!.remove(img);
                          });
                        },
                        //아이콘의 X부분이 투명해서 안의 내용을 채울수 있도록 새로 만들었음
                        icon: iconCancel(),
                      ))
                ],
              );
              //map과 toList 세트
            }).toList(),
          )
        //아무것도 선택되지 않았다면 빈 컨테이너 반환
        : Container();
  }

  //사진삭제 아이콘 설정 함수
  Stack iconCancel() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
        )),
        const Icon(
          Icons.cancel,
          color: Colors.white,
          size: 25,
        )
      ],
    );
  }
}
