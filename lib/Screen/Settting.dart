import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/theme/themeManager.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

ThemeManager themeManager = ThemeManager();

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff060720),
      appBar: AppBar(
        backgroundColor: Color(0xff060720),
        actions: [
          Switch(
              value: themeManager.themeMode == ThemeMode.light,
              onChanged: (newValues) {
                themeManager.toggleTheme(newValues);
                setState(() {});
              })
        ],
      ),
    );
  }
}
