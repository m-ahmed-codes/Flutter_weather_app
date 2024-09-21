import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/Screen/bottom_navigation.dart';
import 'package:weather_app/model/Model.dart';

import '../data/fetching_method.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SpashpageState();
}

class _SpashpageState extends State<SplashPage> {
  Map data = {};

  callFuture() async {
    await FetchApi().getData().whenComplete(() {
      Timer(Duration(seconds: 1), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      GoRouter.of(context).pushNamed("bottomnavigation");
    });
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Center(
        child: Container(
      width: mywidth,
      height: myHeight,
      color: Color(0xff060720),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to Weather app",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none)),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(color: Colors.blue.shade400)
        ],
      ),
    ));
  }
}
