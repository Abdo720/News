import 'package:flutter/material.dart';
import 'package:news/appScreen.dart';
import 'package:news/splachScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splachscreen.routeName,
      routes: {
        AppScreen.routeName: (context) => AppScreen(),
        Splachscreen.routeName: (context) => Splachscreen(),
      },
    );
  }
}
