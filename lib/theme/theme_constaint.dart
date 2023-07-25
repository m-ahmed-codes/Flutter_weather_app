import 'package:flutter/material.dart';

const primary_Color = Colors.brown;

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.yellow,
        onPrimary: primary_Color,
        secondary: primary_Color,
        onSecondary: primary_Color,
        error: primary_Color,
        onError: primary_Color,
        background: primary_Color,
        onBackground: primary_Color,
        surface: primary_Color,
        onSurface: primary_Color),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black))));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: primary_Color,
        onPrimary: primary_Color,
        secondary: Colors.white,
        onSecondary: Colors.white,
        error: primary_Color,
        onError: primary_Color,
        background: primary_Color,
        onBackground: primary_Color,
        surface: Colors.white,
        onSurface: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(color: Colors.white)));


// elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ButtonStyle(
//             backgroundColor:
//                 MaterialStateProperty.all<Color>(Colors.deepPurple))),