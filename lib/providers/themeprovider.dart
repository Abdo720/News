import 'package:flutter/material.dart';
import 'package:news/Core/themeing.dart';

class Themeprovider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  void toggleTheme() {
    theme = theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
