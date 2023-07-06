import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/model/place_model.dart';

class NoticeboardPlaceScreen extends StatefulWidget {
  const NoticeboardPlaceScreen({super.key});

  @override
  State<NoticeboardPlaceScreen> createState() => _NoticeboardPlaceScreenState();
}

class _NoticeboardPlaceScreenState extends State<NoticeboardPlaceScreen> {
  final pmodel = Place().place;
  var selectCity = "";
  var city = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("지역 선택")),
      body: SafeArea(
        child: city ? cityButton() : localButton(selectCity),
      ),
    );
  }

  Widget cityButton() {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.all(15),
          child: GridView.builder(
            //item 개수 제한
            itemCount: pmodel.length,
            //높이 지정 에러 방지
            scrollDirection: Axis.vertical,
            shrinkWrap: true, //
            //GridView가 나올대 보여질 규칙 설정
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //열 개수
                crossAxisCount: 2,
                //박스 가로세로 비율
                childAspectRatio: 3 / 1,
                //가로 세로 여백
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            //반복적으로 리스트 내 항목만큼 체크박스 만들어냄
            itemBuilder: (context, index) {
              //인덱스에 해당하는 지역이름
              String place = pmodel.keys.toList()[index];
              return OutlinedButton(
                  //눌렀을 경우 어떻게 될지 정해야함
                  onPressed: () {
                    setState(() {
                      selectCity = place;
                      city = !city;
                    });
                  },
                  child: Text(
                    place,
                    style: const TextStyle(fontSize: 20),
                  ));
            },
          )),
    );
  }

  Widget localButton(String place) {
    //cityButton에서 누른 도시의 map 데이터
    var cityModel = pmodel[place];
    //버튼의 너비를 cityButton과의 같은 크기로 계산
    var btnWidth = (MediaQuery.of(context).size.width - 40) / 2;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: btnWidth,
              height: btnWidth / 3,
              child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      city = !city;
                    });
                  },
                  child: Text(
                    place,
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
            const SizedBox(height: 10),
            ExpansionPanelList.radio(
              children: [
                //하나씩 지역구를 가져옴
                for (var i in cityModel!)
                  //출력되는 i에서 keys를 가져오고, String 형식으로 바꿔서 양쪽 괄호를 제거해줌
                  //여기서 변수 i를 3번 가공 해줘야 하는데 모르겠음
                  //그래서 i에 꼬리가 길게 붙음
                  ExpansionPanelRadio(
                    //패널의 위치값
                    value: Text(i.keys
                        .toString()
                        .substring(1, i.keys.toString().length - 1)),
                    //헤더 전체 클릭시 확장
                    canTapOnHeader: true,
                    //패널 제목 설정
                    headerBuilder: (context, isExpanded) {
                      var j = i.keys
                          .toString()
                          .substring(1, i.keys.toString().length - 1);
                      return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            j,
                            style: const TextStyle(fontSize: 20),
                          ));
                    },
                    //패널 펼쳤을 때 내용 설정
                    body: GridView.builder(
                      //index의 값 범위 지정해줌
                      itemCount: i[i.keys
                              .toString()
                              .substring(1, i.keys.toString().length - 1)]!
                          .length,
                      //높이 지정 에러 방지
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true, //
                      //GridView가 나올대 보여질 규칙 설정
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 4 / 1,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return TextButton(
                          //누른 항목이 전달됨
                          onPressed: () {
                            Get.back(
                                result: i[i.keys.toString().substring(
                                    1, i.keys.toString().length - 1)]![index]);
                          },
                          child: Text(
                            i[i.keys.toString().substring(
                                1, i.keys.toString().length - 1)]![index],
                            style: const TextStyle(fontSize: 18),
                          ),
                        );
                      },
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
