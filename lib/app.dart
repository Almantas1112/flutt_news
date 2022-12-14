// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutt_news/bloc/network/network_bloc.dart';
import 'package:flutt_news/widgets/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.amber),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: BlocProvider(
            create: (context) => NetworkBloc()..add(NetworkObserve()),
            child: const Home(),
          ),
        );
      },
    );
  }
}
