import 'package:flutter/material.dart';
import 'package:jigu/screen/chat_detail_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("채팅 화면"),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatDetailScreen(),
              ));
        },
        child: ListView(
          children: [
            Container(
              color: Colors.blue.shade100,
              height: 100,
              child: const Center(
                  child: Text(
                "야",
                style: TextStyle(fontSize: 20),
              )),
            ),
            Container(
              color: Colors.blue.shade200,
              height: 100,
              child: const Center(
                  child: Text("야", style: TextStyle(fontSize: 20))),
            ),
            Container(
              color: Colors.blue.shade300,
              height: 100,
              child: const Center(
                  child: Text("야", style: TextStyle(fontSize: 20))),
            ),
            Container(
              color: Colors.blue.shade400,
              height: 100,
              child: const Center(
                  child: Text("야", style: TextStyle(fontSize: 20))),
            ),
            Container(
              color: Colors.blue.shade100,
              height: 100,
              child: const Center(
                  child: Text("야", style: TextStyle(fontSize: 20))),
            ),
            Container(
              color: Colors.blue.shade200,
              height: 100,
              child: const Center(
                  child: Text("야", style: TextStyle(fontSize: 20))),
            ),
            Container(
              color: Colors.blue.shade300,
              height: 100,
              child: const Center(
                  child: Text("야", style: TextStyle(fontSize: 20))),
            ),
            Container(
              color: Colors.blue.shade400,
              height: 100,
              child: const Center(
                  child: Text("왜", style: TextStyle(fontSize: 20))),
            ),
          ],
        ),
      ),
    );
  }
}
