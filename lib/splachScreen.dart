import 'package:flutter/material.dart';
import 'package:news/Core/Colors.dart';
import 'package:news/appScreen.dart';
import 'package:news/providers/themeprovider.dart';
import 'package:provider/provider.dart';

class Splachscreen extends StatefulWidget {
  static String routeName = "splachScreen";
  const Splachscreen({super.key});

  @override
  State<Splachscreen> createState() => _SplachscreenState();
}

class _SplachscreenState extends State<Splachscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppScreen.routeName,
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<Themeprovider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              themeProv.theme == ThemeMode.light
                  ? "assets/images/news_logo_light.png"
                  : "assets/images/news_logo.png",
            ),
            Spacer(),
            Image.asset(
              themeProv.theme == ThemeMode.light
                  ? "assets/images/ABDO Abdullah Mohammed_light.png"
                  : "assets/images/ABDO Abdullah Mohammed.png",
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
