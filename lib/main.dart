import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'util/themes.dart';
import 'util/theme_notifier.dart';
import 'pages/ieeeEvents.dart';
import 'pages/csiEvents.dart';
import 'pages/roboClub.dart';
import 'pages/aeroClub.dart';
import 'pages/dramaClub.dart';
import 'pages/sports.dart';
import 'pages/settings.dart';
import 'pages/home.dart';
import 'pages/faculty.dart';
import 'pages/about.dart';
import 'pages/logIn.dart';
import 'pages/messages.dart';
import 'pages/news.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var darkModeOn = prefs.getBool('darkMode') ?? true;
    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
        child: MyApp(),
      ),
    );
  });

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Activity Tracker',
      theme: themeNotifier.getTheme(),
      home: LoginPage(),
      initialRoute: '/',
      routes: {
        Home.routeName: (ctx) => Home(),
        IEEEevents.routeName: (ctx) => IEEEevents(),
        CSIevents.routeName: (ctx)=> CSIevents(),
        RoboClub.routeName: (ctx) => RoboClub(),
        AeroClub.routeName: (ctx) => AeroClub(),
        DramaClub.routeName: (ctx) => DramaClub(),
        Sports.routeName: (ctx)=> Sports(),
        SettingsPage.routeName : (ctx) => SettingsPage(),
        Faculty.routeName: (ctx) => Faculty(),
        AboutScreen.routeName: (ctx) => AboutScreen(),
        Messages.routeName: (ctx) => Messages(),
        News.routeName: (ctx) => News(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Home());
      },
    );
  }
}

