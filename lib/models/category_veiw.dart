import 'package:flutter/material.dart';

class CategoryVeiw {
  String id;
  String label;
  String image;

  CategoryVeiw({required this.id, required this.label, required this.image});

  static List<CategoryVeiw> getCategory(ThemeMode currentTheme) {
    final isLight = currentTheme == ThemeMode.light;
    return [
      CategoryVeiw(
        id: 'general',
        label: 'General',
        image: isLight
            ? 'assets/images/general.png'
            : 'assets/images/general_dark.png',
      ),
      CategoryVeiw(
        id: 'business',
        label: 'Business',
        image: isLight
            ? 'assets/images/busniess.png'
            : 'assets/images/busniess_dark.png',
      ),
      CategoryVeiw(
        id: 'sports',
        label: 'Sports',
        image: isLight
            ? 'assets/images/sport.png'
            : 'assets/images/sport_dark.png',
      ),
      CategoryVeiw(
        id: 'technology',
        label: 'Technology',
        image: isLight
            ? 'assets/images/technology.png'
            : 'assets/images/technology_dark.png',
      ),
      CategoryVeiw(
        id: 'science',
        label: 'Science',
        image: isLight
            ? 'assets/images/science.png'
            : 'assets/images/science_dark.png',
      ),
      CategoryVeiw(
        id: 'health',
        label: 'Health',
        image: isLight
            ? 'assets/images/helth.png'
            : 'assets/images/helth_dark.png',
      ),
      CategoryVeiw(
        id: 'entertainment',
        label: 'Entertainment',
        image: isLight
            ? 'assets/images/entertainment.png'
            : 'assets/images/science_dark.png',
      ),
    ];
  }
}
