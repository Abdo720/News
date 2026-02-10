import 'package:flutter/material.dart';
import 'package:news/Wedgit/suorce_view.dart';

class AppScreen extends StatefulWidget {
  static String routeName = "AppScreen";

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News"), centerTitle: true),
      body: Column(children: [Expanded(child: SuorceView())]),
    );
  }
}
