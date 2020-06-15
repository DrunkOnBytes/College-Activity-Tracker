import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/activityCard.dart';
import '../util/imageStorageUtil.dart';

class Sports extends StatelessWidget {

  static const routeName = '/sports';

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
          "Sports",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: ScreenUtil.instance.setSp(22.0),
          ),
        ),
        centerTitle: true,
//          backgroundColor: Color.fromRGBO(77, 77, 255, 0.7),
      ),
      body: ActivityCards('sports'),
      floatingActionButton: AddButton('sports'),
    );
  }
}
