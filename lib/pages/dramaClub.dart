import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/activityCard.dart';

class DramaClub extends StatelessWidget {

  static const routeName = '/dramaClub';

  @override
  Widget build(BuildContext context) {

    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Drama Club",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: ScreenUtil.instance.setSp(22.0),
          ),
        ),
        centerTitle: true,
//          backgroundColor: Color.fromRGBO(77, 77, 255, 0.7),
      ),
      body: ListView(
        children: [
          ActivityCard('Test1','testimg/1.jpg'),
          ActivityCard('Test2','testimg/2.jpg'),
          ActivityCard('Test3','testimg/3.jpg'),
          ActivityCard('Test4','testimg/4.jpg'),
        ],
      ),
    );
  }
}
