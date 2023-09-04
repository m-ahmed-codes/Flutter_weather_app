import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screen/Forecast.dart';
import 'package:weather_app/Screen/Home.dart';
import 'package:weather_app/Screen/Search.dart';
import 'package:weather_app/bloc/weatherapi_bloc.dart';
// import 'bloc/weatherapi_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> WidgetOption = <Widget>[
      HomePage(),

      SearchPage(),
      ForecastPage(),
      // Setting(),
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherapiHomeBloc(),
        ),
        BlocProvider(
          create: (context) => WeatherapiSearchBloc(),
        ),
        BlocProvider(
          create: (context) => WeatherapiForecastBloc(),
        ),
      ],
      child: Scaffold(
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
      ),
    );
  }
}
