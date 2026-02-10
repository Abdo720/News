import 'package:flutter/material.dart';
import 'package:news/Core/Colors.dart';

class MainError extends StatelessWidget {
  final String errorMassage;
  final VoidCallback onclick;
  MainError({super.key, required this.errorMassage, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(errorMassage, style: TextStyle(color: AppColors.blackColor)),
          ElevatedButton(onPressed: onclick, child: Text("Try Again")),
        ],
      ),
    );
  }
}
