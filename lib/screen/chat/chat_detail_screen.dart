import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드 내리기
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(child: Text("알림끄기")),
                const PopupMenuItem(child: Text("차단하기")),
                const PopupMenuItem(child: Text("채팅방 나가기")),
              ],
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.amber[50],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.grey,
                      )),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "메세지를 입력하세요"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        color: Colors.grey,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
