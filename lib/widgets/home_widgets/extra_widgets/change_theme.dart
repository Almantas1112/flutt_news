import 'package:flutt_news/app.dart';
import 'package:flutter/material.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 300.0,
        top: 50.0,
      ),
      child: FloatingActionButton(
        child: const Icon(Icons.sunny),
        onPressed: () {
          App.themeNotifier.value = App.themeNotifier.value == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light;
        },
      ),
    );
  }
}
