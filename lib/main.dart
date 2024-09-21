import 'package:flutter/material.dart';
import 'package:weather_app/routes/app_routes_config.dart';
import 'package:weather_app/theme/theme_constaint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather app',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: MyAppRoutes().router,
    );
  }
}
