//import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:weather_app/Screen/Forecast.dart';
import 'package:weather_app/Screen/Home.dart';
import 'package:weather_app/Screen/Search.dart';
import 'package:weather_app/Screen/Settting.dart';
// import 'package:weather_app/Screen/locations.dart';
import 'package:weather_app/Screen/Splash.dart';
import 'package:weather_app/model/Model.dart';
import 'package:weather_app/theme/themeManager.dart';
import 'package:weather_app/theme/theme_constaint.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();
Setting seting = Setting();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void dispose() {
    // seting.

    _themeManager.removeListener(themeListener);

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _themeManager.addListener(themeListener);
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // List<Hour?>? hourWeather = []; , required this.hourWeather
  Root root = Root();
  MyHomePage({required this.root});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //  Container & Center and Text and style Widgets

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> WidgetOption = <Widget>[
      HomePage(
        weather: widget.root,
        // hourWeather: widget.hourWeather,
      ),
      SearchPage(),
      ForecastPage(
        weather: widget.root,
      ),
      Setting(),
    ];
    // print(widget.root.location?.name);
    return Scaffold(
      // appBar: AppBar(
      //   //  backgroundColor: the,
      //   actions: [
      //     Switch(
      //         value: _themeManager.themeMode == ThemeMode.light,
      //         onChanged: (newValues) {
      //           _themeManager.toggleTheme(newValues);
      //           // setState(() {});
      //         })
      //   ],
      // ),
      body: Center(
        child: Container(
          child: WidgetOption.elementAt(_currentindex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff060720),
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            activeIcon: Icon(Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web_asset_outlined),
            // backgroundColor: ,
            label: "Forecast",
            activeIcon: Icon(Icons.web_asset_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications_outlined),
            // backgroundColor: ,
            label: "Setting",
            activeIcon: Icon(Icons.settings_applications_rounded),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
