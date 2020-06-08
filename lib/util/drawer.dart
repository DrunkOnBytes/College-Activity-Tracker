import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/faculty.dart';
import '../pages/settings.dart';
import '../pages/about.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function handlingTap) {

    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: handlingTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.instance.setHeight(130),
            width: double.infinity,
            padding: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
            alignment: Alignment.centerLeft,
            child: Text(
              "Navigate",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: ScreenUtil.instance.setSp(30.0),
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.instance.setHeight(20),
          ),
          buildListTile("Home", Icons.home, (){
            Navigator.of(context).pushReplacementNamed('/');
          }),

          buildListTile("Faculty", Icons.account_circle,(){
            Navigator.of(context).pushNamed(Faculty.routeName);
          }),
          buildListTile("About", Icons.info,(){
            Navigator.of(context).pushNamed(AboutScreen.routeName);
          }),
          buildListTile("Settings", Icons.settings,(){
            Navigator.of(context).pushNamed(SettingsPage.routeName);
          }),
          SizedBox(
            height: ScreenUtil.instance.setHeight(30),
          ),
          Container(
            child: Text("Built by CrypticCoders with ❤️ and ☕"),
          )
        ],
      ),
    );
  }
}