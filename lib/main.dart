import '/notifier/user_notifier.dart';

import '/notifier/share_notifier.dart';
import '/screen/Local/local_main_screen.dart';
import '/notifier/theme_notifier.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeChanger(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShareMapOfData(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: 'Share Continus',
      themeMode: themeprovider.themeMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<void> check() async {
    await Storage().checkData();
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2));
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LocalMainScreen());
  }
}
