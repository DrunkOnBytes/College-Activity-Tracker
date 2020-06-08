import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/drawer.dart';
import 'settings.dart';
import 'ieeeEvents.dart';
import 'csiEvents.dart';
import 'roboClub.dart';
import 'aeroClub.dart';
import 'dramaClub.dart';
import 'sports.dart';

class Home extends StatelessWidget {
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
      drawer: MainDrawer(),
      appBar: AppBar(

        title: Text(
          "Activities Portal",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: ScreenUtil.instance.setSp(22.0),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings,
              color: Colors.white,),
            onPressed: (){
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
          )
        ],
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(IEEEevents.routeName),
                            splashColor: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15)),
                              width: ScreenUtil.instance.setWidth(160),
                              height: ScreenUtil.instance.setHeight(130),
                              padding: EdgeInsets.all(ScreenUtil.instance.setWidth(15.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.event_note,
                                    size: ScreenUtil.instance.setSp(32.0),


                                  ),
                                  Text(
                                    'IEEE Events',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: ScreenUtil.instance.setSp(18.0),
                                        letterSpacing: 2
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(255,77,77, 0.8)


                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(CSIevents.routeName),
                            splashColor: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),

                            child: Container(
                              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15)),
                              width: ScreenUtil.instance.setWidth(160),
                              height: ScreenUtil.instance.setHeight(130),
                              padding: EdgeInsets.all(ScreenUtil.instance.setWidth(15.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.personal_video,
                                    size: ScreenUtil.instance.setSp(32.0),
                                  ),
                                  Text(
                                    'Computer Society of India',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: ScreenUtil.instance.setSp(13.0),
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 2
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(71, 209, 209, 0.9)
                              ),
                            ),
                          )
                        ],

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(RoboClub.routeName),
                            splashColor: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),

                            child: Container(
                              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15)),
                              width: ScreenUtil.instance.setWidth(160),
                              height: ScreenUtil.instance.setHeight(130),
                              padding: EdgeInsets.all(ScreenUtil.instance.setWidth(15.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.build,
                                    size: ScreenUtil.instance.setSp(32.0),
                                  ),
                                  Text(
                                    'Robo Club',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: ScreenUtil.instance.setSp(16.0),
                                        letterSpacing: 2
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(255, 163, 26 ,0.8)
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(AeroClub.routeName),
                            splashColor: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),

                            child: Container(
                              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15)),
                              width: ScreenUtil.instance.setWidth(160),
                              height: ScreenUtil.instance.setHeight(130),
                              padding: EdgeInsets.all(ScreenUtil.instance.setWidth(15.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.flight_takeoff,
                                    size: ScreenUtil.instance.setSp(32.0),
                                  ),
                                  Text(
                                    'Aero Club',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: ScreenUtil.instance.setSp(18.0),
                                        letterSpacing: 2
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(210, 121, 166, 0.8)
                              ),
                            ),
                          )
                        ],

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(DramaClub.routeName),
                            splashColor: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),

                            child: Container(
                              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15)),
                              width: ScreenUtil.instance.setWidth(160),
                              height: ScreenUtil.instance.setHeight(130),
                              padding:  EdgeInsets.all(ScreenUtil.instance.setWidth(15.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.mood,
                                        size: ScreenUtil.instance.setSp(32.0),
                                      ),
                                      Icon(
                                        Icons.mood_bad,
                                        size: ScreenUtil.instance.setSp(32.0),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Drama Club',textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: ScreenUtil.instance.setSp(18.0),
                                        letterSpacing: 2
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(153, 179, 255, 0.9)
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(Sports.routeName),
                            splashColor: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),

                            child: Container(
                              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(20)),
                              width: ScreenUtil.instance.setWidth(160),
                              height: ScreenUtil.instance.setHeight(130),
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.pool,
                                        size: ScreenUtil.instance.setSp(32.0),
                                      ),
                                      Icon(
                                        Icons.fitness_center,
                                        size: ScreenUtil.instance.setSp(32.0),
                                      ),
                                      Icon(
                                        Icons.golf_course,
                                        size: ScreenUtil.instance.setSp(32.0),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Sports',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: ScreenUtil.instance.setSp(18.0),
                                        letterSpacing: 2
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(255, 140, 26, 0.6)
                              ),
                            ),
                          ),
                        ],

                      ),

                    ],
                  )

                ],
//                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                  maxCrossAxisExtent: deviceSize.width,
////                  maxCrossAxisExtent: 200,
//                    childAspectRatio: 3 / 2,
////                  crossAxisSpacing: 20,
////                  mainAxisSpacing: 20
//                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
