import 'package:calories/clippers/triple_circle_clipper.dart';
import 'package:calories/recipe/widgets/circle_guage.dart';
import 'package:calories/utils/app_assets.dart';
import 'package:calories/utils/app_spacing.dart';
import 'package:calories/utils/app_typography.dart';
import 'package:calories/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sficon/flutter_sficon.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({super.key});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> hemisphereDis;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    hemisphereDis = Tween<double>(begin: 75, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubicEmphasized,
      ),
    );
    super.initState();
    playAnim();
  }

  void playAnim() => _animationController.forward(from: 0.0);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Scaffold(
        body: context.devicePadding(
          context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: SFIcon(SFIcons.sf_chevron_left, fontSize: 22),
              ),
              AppSpacing.v8,
              SizedBox(
                height: context.deviceHt * 0.45,
                child: ClipPath(
                  clipper: TripleCircleClipper(
                    hemisphereDistance: hemisphereDis.value,
                  ),
                  child: Image.asset(AppAssets.recipeDetails, fit: BoxFit.fill),
                ),
              ),
              AppSpacing.v12,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appLocale.lazyOatmeal,
                        style: AppTypography().textXLSemiBold,
                      ),
                      Text(
                        appLocale.recipeMeta,
                        style: AppTypography().textXSmGreyed,
                      ),
                    ],
                  ),
                  SFIcon(SFIcons.sf_heart_fill, color: Colors.black),
                ],
              ),

              AppSpacing.v18,
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocale.descriptionTitle,
                    style: AppTypography().textMd20Medium,
                  ),
                  Text(
                    appLocale.lazyOatmealDescription,
                    style: AppTypography().textSmGreyed.copyWith(
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
              AppSpacing.v12,

              Text(
                appLocale.nutritionalValue,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              AppSpacing.v20,

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(3, (index) {
                      final guageData = {
                        0: ['360 g', 'Fat', 0.6],
                        1: ['64 g', 'Pro', 0.35],
                        2: ['80 g', 'Carb', 0.22],
                      };
                      return Flexible(
                        child: CircleGuage(
                          title: guageData[index]![0].toString(),
                          subtitle: guageData[index]![1].toString(),
                          completed:
                              double.tryParse(
                                guageData[index]![2].toString(),
                              ) ??
                              0.0,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              AppSpacing.v18,
            ],
          ),
        ),
      ),
    );
  }
}
