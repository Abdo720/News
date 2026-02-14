import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Core/Colors.dart';
import 'package:news/providers/themeprovider.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  Function onClick;

  DrawerView({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: AppColors.whiteColor,
            child: Center(
              child: Text(
                "News App",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: AppColors.blackColor,
                  fontWeight: .bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 18, left: 12),
              height: double.infinity,
              width: double.infinity,
              color: AppColors.blackColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      onClick();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.home, color: AppColors.whiteColor),
                        SizedBox(width: 12),
                        Text(
                          "Go To Home",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Divider(color: Colors.grey, thickness: 1),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/icon.png',
                        width: 18.5,
                        height: 20,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Theme",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: themeProvider.theme == ThemeMode.dark,
                        onChanged: (val) {
                          themeProvider.toggleTheme();
                        },
                        activeColor: Theme.of(context).splashColor,
                        inactiveThumbColor: Theme.of(context).primaryColor,
                        inactiveTrackColor: Theme.of(
                          context,
                        ).primaryColor.withOpacity(0.12),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(color: Colors.grey, thickness: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
