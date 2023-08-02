import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/seller/seller_screen.dart';

class MypageSellerScreen extends StatelessWidget {
  const MypageSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("관심 판매자"),
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            mySeller(
              "뉴진스",
              "<마트/편의점>",
              "안녕하세요. 뉴진스입니다. 이번 신곡 슈퍼샤이 많이 사랑해주세요.",
            ),
            mySeller("에스파", "꽃집", "안녕하세요. 에스파입니다. 저희 개쩖")
          ],
        ),
      )),
    );
  }

  Widget mySeller(String name, String Kate, String intro) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () => Get.to(() => const SellerScreen()),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        Kate,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        intro,
                        style: const TextStyle(fontSize: 15),
                        maxLines: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
