import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
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
              border: Border.all(
                color: Color(0xff5C48F2),
                width: 1.7
              ),
            ),
            child: Icon(
              Icons.person,
              color: Color(0xff5C48F2),
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: Center(),
    );
  }
}
