import 'package:calories/ui/home/widgets/bar_chart.dart';
import 'package:calories/ui/recipe/views/recipe_details_page.dart';
import 'package:calories/ui/recipe/views/recipes_page.dart';
import 'package:calories/utils/app_assets.dart';
import 'package:calories/utils/app_spacing.dart';
import 'package:calories/utils/app_typography.dart';
import 'package:calories/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sficon/flutter_sficon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.devicePadding(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appLocale.greeting, style: AppTypography().textSmGreyed),
            AppSpacing.v10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocale.startHealthyDay,
                  style: AppTypography().textXLSemiBold,
                ),
                CircleAvatar(
                  radius: context.deviceWt * 0.055,
                  backgroundImage: AssetImage(AppAssets.profilePhoto),
                ),
              ],
            ),
            Expanded(child: BarChart()),
            AppSpacing.v30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    text: "350",
                    style: AppTypography().textXXLSemiBold,
                    children: [
                      TextSpan(
                        text: " /1045",
                        style: AppTypography().textSmGreyed.copyWith(
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  appLocale.kcalLeft,
                  style: AppTypography().textMdMedium.copyWith(height: 2.4),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SFIcon(SFIcons.sf_person, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {
                      final page = PageRouteBuilder(
                        pageBuilder: (context, _, _) => RecipeDetailsPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              final positionAnim =
                                  Tween<Offset>(
                                    begin: Offset(-1, 0),
                                    end: Offset.zero,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.ease,
                                    ),
                                  );
                              return SlideTransition(
                                position: positionAnim,
                                child: RecipeDetailsPage(),
                              );
                            },
                      );
                      Navigator.of(context).push(page);
                    },
                    icon: SFIcon(SFIcons.sf_fork_knife, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {
                      final page = PageRouteBuilder(
                        pageBuilder: (context, _, _) => RecipesPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              final positionAnim =
                                  Tween<Offset>(
                                    begin: Offset(0, -1),
                                    end: Offset.zero,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.ease,
                                    ),
                                  );
                              return SlideTransition(
                                position: positionAnim,
                                child: RecipesPage(),
                              );
                            },
                      );
                      Navigator.of(context).push(page);
                    },
                    icon: SFIcon(
                      SFIcons.sf_plus,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    style: IconButton.styleFrom(backgroundColor: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SFIcon(SFIcons.sf_dumbbell, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SFIcon(SFIcons.sf_chart_bar_xaxis, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
