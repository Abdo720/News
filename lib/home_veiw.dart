import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Core/Colors.dart';
import 'package:news/models/category_veiw.dart';
import 'package:news/providers/themeprovider.dart';
import 'package:provider/provider.dart';

class HomeVeiw extends StatelessWidget {
  Function onClick;
  static String routeName = "HomeVeiw";
  HomeVeiw({super.key, required this.onClick});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    List<CategoryVeiw> categories = CategoryVeiw.getCategory(
      themeProvider.theme,
    );
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning\nHere is Some News For You",
              style: GoogleFonts.inter(
                color: Theme.of(context).splashColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 12),

              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onClick(categories[index]);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Theme.of(context).splashColor),
                    ),
                    child: Stack(
                      alignment: index.isOdd
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      children: [
                        Stack(
                          alignment: index.isOdd
                              ? Alignment.bottomLeft
                              : Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.asset(categories[index].image),
                            ),

                            Container(
                              padding: EdgeInsets.only(
                                left: index.isOdd ? 0 : 12,
                                right: index.isEven ? 0 : 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.greyColor.withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  Visibility(
                                    visible: index.isOdd,
                                    child: Image.asset(
                                      themeProvider.theme == ThemeMode.light
                                          ? "assets/images/arrow_back_light.png"
                                          : "assets/images/arrow_back.png",
                                    ),
                                  ),
                                  Text(
                                    " View All ",
                                    style: GoogleFonts.poppins(
                                      color: Theme.of(context).splashColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Visibility(
                                    visible: index.isEven,
                                    child: Image.asset(
                                      themeProvider.theme == ThemeMode.light
                                          ? "assets/images/arrow_light.png"
                                          : "assets/images/arrow.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 40.0,
                            right: 30,
                          ),
                          child: Text(
                            categories[index].label,
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).splashColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: categories.length,
            ),
          ],
        ),
      ),
    );
  }
}
