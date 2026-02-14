import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Core/Colors.dart';
import 'package:news/Wedgit/drower_veiw.dart';
import 'package:news/Wedgit/suorce_view.dart';
import 'package:news/home_veiw.dart';
import 'package:news/models/category_veiw.dart';

class AppScreen extends StatefulWidget {
  static String routeName = "AppScreen";

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(onClick: onDrawerClicked),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedCategory == null ? "Home" : selectedCategory!.label,
          style: GoogleFonts.inter(
            color: Theme.of(context).splashColor,
            fontSize: 20,
            fontWeight: .w500,
          ),
        ),
      ),

      body: selectedCategory == null
          ? HomeVeiw(onClick: onClick)
          : SuorceView(categoryId: selectedCategory!.id),
    );
  }

  CategoryVeiw? selectedCategory;

  void onDrawerClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }

  void onClick(CategoryVeiw category) {
    selectedCategory = category;
    setState(() {});
  }
}
