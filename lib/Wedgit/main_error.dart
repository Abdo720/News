import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          Text(
            errorMassage,
            style: TextStyle(color: Theme.of(context).splashColor),
          ),
          ElevatedButton(
            onPressed: onclick,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: Text(
              "Try Again",
              style: GoogleFonts.inter(
                color: Theme.of(context).splashColor,
                fontSize: 20,
                fontWeight: .bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
