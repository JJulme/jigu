import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';

class NoticeboardDetailScreen extends StatefulWidget {
  const NoticeboardDetailScreen({super.key});

  @override
  State<NoticeboardDetailScreen> createState() =>
      _NoticeboardDetailScreenState();
}

class _NoticeboardDetailScreenState extends State<NoticeboardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //공유버튼
          IconButton(
              onPressed: () {
                Share.share("보고있는 페이지 공유기능 구현해야 함");
              },
              icon: const Icon(Icons.share)),
          //더보기 버튼
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(child: Text("즐겨찾기")),
              const PopupMenuItem(child: Text("신고하기"))
            ],
          )
        ],
      ),
      //UI 안잘리도록 해주는 클래스
      body: SafeArea(
        //화면넘칠시 스크롤 생성
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(10),
                //본문 내용 정렬
                alignment: Alignment.topLeft,
                //본문 내용
                child: const Text(
                  "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 140,
                  child: Row(
                    children: [
                      //프로필 사진
                      const Icon(Icons.person, size: 100),
                      //중간 작은 공백
                      const SizedBox(width: 10),
                      //판매자 정보
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg: "판매자 정보를 보여주는 페이지로 넘어가야함.",
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey.withOpacity(0.9),
                                toastLength: Toast.LENGTH_SHORT,
                              );
                            },
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "세븐일레븐 부산수영푸른빌점",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text("마트/편의점",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          copyClipboardToast("부산 수영구 망미번영로16번길 74"),
                          const SizedBox(height: 5),
                          copyClipboardToast("010-8285-3283"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //클립보드에 문자 복사와 토스트 메세지 띄움
  InkWell copyClipboardToast(String text) {
    return InkWell(
      child:
          Text(text, style: const TextStyle(fontSize: 18, color: Colors.black)),
      onTap: () {
        copyClipboard(text);
        copyToast();
      },
    );
  }
}

//단순히 토스트메세지 띄워주는 함수
void copyToast() {
  Fluttertoast.showToast(
    msg: "클립보드에 복사되었습니다.",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey.withOpacity(0.9),
    toastLength: Toast.LENGTH_SHORT,
  );
}

//들어간 텍스트를 클립보드에 복사해주는 함수
void copyClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}
