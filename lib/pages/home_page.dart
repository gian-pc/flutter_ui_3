
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:fl_chart/fl_chart.dart';


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
                      fontWeight: FontWeight.bold
                    ),
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
                      pieTouchData:
                      PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
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
              Text("sdsd")
            ],
          ),
        ),
      ),
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
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}



