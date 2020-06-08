import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Faculty extends StatelessWidget {
  static const routeName = '/faculty';
  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Faculty in Discussion",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: ScreenUtil.instance.setSp(22.0),
              color: Colors.white),
        ),
        centerTitle: true,
//        backgroundColor: Color.fromRGBO(77, 77, 255, 0.7),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: deviceSize.height,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil.instance.setWidth(20)),
                            width: ScreenUtil.instance.setWidth(160),
                            height: ScreenUtil.instance.setHeight(130),
                            padding: EdgeInsets.all(
                                ScreenUtil.instance.setWidth(15.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  size: ScreenUtil.instance.setSp(32.0),
                                ),
                                Text(
                                  'Heena Bhatia',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: ScreenUtil.instance.setSp(18.0),
                                      letterSpacing: 2),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil.instance.setWidth(20)),
                            width: ScreenUtil.instance.setWidth(160),
                            height: ScreenUtil.instance.setHeight(130),
                            padding: EdgeInsets.all(
                                ScreenUtil.instance.setWidth(15.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  size: ScreenUtil.instance.setSp(32.0),
                                ),
                                Text(
                                  'Rashmi Shinde',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: ScreenUtil.instance.setSp(18.0),
                                      letterSpacing: 2),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil.instance.setWidth(20)),
                            width: ScreenUtil.instance.setWidth(160),
                            height: ScreenUtil.instance.setHeight(130),
                            padding: EdgeInsets.all(
                                ScreenUtil.instance.setWidth(15.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  size: ScreenUtil.instance.setSp(32.0),
                                ),
                                Text(
                                  'Nitin Rajput',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: ScreenUtil.instance.setSp(18.0),
                                      letterSpacing: 2),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil.instance.setWidth(20)),
                            width: ScreenUtil.instance.setWidth(160),
                            height: ScreenUtil.instance.setHeight(130),
                            padding: EdgeInsets.all(
                                ScreenUtil.instance.setWidth(15.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  size: ScreenUtil.instance.setSp(32.0),
                                ),
                                Text(
                                  'Gagan Meena',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: ScreenUtil.instance.setSp(18.0),
                                      letterSpacing: 2),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil.instance.setWidth(20)),
                            width: ScreenUtil.instance.setWidth(160),
                            height: ScreenUtil.instance.setHeight(130),
                            padding: EdgeInsets.all(
                                ScreenUtil.instance.setWidth(15.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  size: ScreenUtil.instance.setSp(32.0),
                                ),
                                Text(
                                  'Richa Purohit',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: ScreenUtil.instance.setSp(18.0),
                                      letterSpacing: 2),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
