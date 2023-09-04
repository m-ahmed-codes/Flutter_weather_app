import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/Screen/Splash.dart';
import 'package:weather_app/Screen/bottom_navigation.dart';
import 'package:weather_app/routes/app_routes-const.dart';

// routes but didnt used in the app
class MyAppRoutes {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: "/",
      name: AppRoutesConstant.SplashRoute,
      builder: (context, state) {
        return SplashPage();
      },
    ),
    GoRoute(
      path: "/bottomnavigation",
      name: AppRoutesConstant.BottomNavigationRoute,
      pageBuilder: (context, state) {
        return MaterialPage(child: MyHomePage());
      },
    ),
  ]);
}
