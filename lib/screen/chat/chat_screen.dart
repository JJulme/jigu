import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/search/search_screen.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var chats = [
    "정현진",
    "임정민",
    "김광호",
    "김기환",
    "랄로",
    "피카츄",
    "퉁퉁이",
    "잼민이",
  ];
  var colorCode = [100, 300, 400, 500, 100, 300, 400, 500];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("채팅 화면"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: GestureDetector(
          onTap: () {
            Get.to(() => const ChatDetailScreen());
          },
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                height: 100,
                color: Colors.indigo[colorCode[index]],
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(child: Text("프사")),
                    ),
                    //Flexible 텍스트 넘침 방지
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //찾는글 제목
                          Text(
                            chats[index],
                            overflow: TextOverflow.clip,
                            softWrap: false,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "이곳에는 마지막에 보낸 채팅 내용이 들어갑니다. 보이는 내용은 최대 2줄이고 넘을 경우 나머지는 잘리게 됩니다.",
                            overflow: TextOverflow.clip,
                            softWrap: false,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
