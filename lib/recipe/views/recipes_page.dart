import 'package:calories/clippers/triple_circle_clipper.dart';
import 'package:calories/recipe/widgets/circle_guage.dart';
import 'package:calories/utils/app_assets.dart';
import 'package:calories/utils/app_spacing.dart';
import 'package:calories/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sficon/flutter_sficon.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage>
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
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        appLocale.recipeMeta,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade500,
                        ),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    appLocale.lazyOatmealDescription,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade800,
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
                      double completionValue() {
                        if (index == 0) {
                          return 0.6;
                        } else if (index == 1) {
                          return 0.35;
                        } else {
                          return 0.22;
                        }
                      }

                      return Flexible(
                        child: CircleGuage(
                          completed: completionValue(),
                          title: "380 g",
                          subtitle: "Fat",
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
