import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_codigo3_ui_3/pages/data_dummy.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color(0xff7f7f7f)),
        elevation: 0,
        actions: [
          // CircleAvatar(
          //   backgroundColor: Color(0xffCED1FF),
          //   child: Icon(
          //     Icons.person,
          //     color: Color(0xff5C48F2),
          //   ),
          // ),
          Container(
            height: 42,
            width: 42,
            margin: EdgeInsets.only(right: 14.0),
            decoration: BoxDecoration(
              color: Color(0xffCED1FF),
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xff5C48F2), width: 1.7),
            ),
            child: Icon(Icons.person, color: Color(0xff5C48F2)),
          ),
        ],
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color(0xff00D399),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Files",
                    style: TextStyle(
                        color: Color(0xff565656),
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Color(0xff7f7f7f),
                  )
                ],
              ),
              AspectRatio(
                aspectRatio: 1.4,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 49,
                      sections: showingSections()),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 240.0,
                //color: Colors.purpleAccent,
                child: PageView.builder(
                  itemCount: miDataMap.length,
                  scrollDirection: Axis.horizontal,
                  controller: PageController(
                    initialPage: 4,
                    viewportFraction: 0.5,
                  ),
                  itemBuilder: (BuildContext context, int i) {
                    return ItemCarouselWidget(
                      index: i + 1,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Files",
                    style: TextStyle(
                        color: Color(0xff565656),
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Color(0xff7f7f7f),
                  )
                ],
              ),
              ListView.builder(
                itemCount: 4,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xffCED1FF),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Icon(Icons.file_copy, color: Color(0xff5C48F2),),
                    ),
                    title: Text("Podscat with Brenda Evans"),
                    subtitle: Text("32Mb March 12, 2021"),
                  );
                },
              )
            ],
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //
      //     ],
      //   ),
      // ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}

class ItemCarouselWidget extends StatelessWidget {
  int index;

  ItemCarouselWidget({required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: miDataMap[index]["backgroundColor"],
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            miDataMap[index]["icon"],
            color: miDataMap[index]["iconColor"],
            size: 50,
          ),
          Expanded(child: Container()),
          Text(
            miDataMap[index]["title"],
            style: TextStyle(
              fontSize: 26.0,
              color: Colors.black87.withOpacity(0.65),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "${miDataMap[index]["number"]} Items",
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Icon(
                Icons.lock,
                color: miDataMap[index]["iconColor"],
                size: 19,
              ),
              Text(
                "Private Folder",
                style: TextStyle(fontSize: 12.0, color: Colors.black54),
              )
            ],
          )
        ],
      ),
    );
  }
}
