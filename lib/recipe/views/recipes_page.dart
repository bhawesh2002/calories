import 'package:calories/clippers/butterfly_shape_clipper.dart';
import 'package:calories/clippers/wave_head_clipper.dart';
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
  late final Animation<double> waveHeight;
  late final Animation<double> butterflyBodyWidth;
  late final Animation<double> butterflyBodyHeight;
  late final Animation<double> butterWingWidth;

  int selectedFilterIndex = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    waveHeight = Tween<double>(begin: 0.2, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubicEmphasized,
      ),
    );

    butterflyBodyWidth = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubicEmphasized,
      ),
    );

    butterflyBodyHeight = Tween<double>(begin: 0.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubicEmphasized,
      ),
    );

    butterWingWidth = Tween<double>(begin: 0.0, end: 0.25).animate(
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
    final filterOptions = [
      appLocale.all,
      appLocale.breakfast,
      appLocale.lunch,
      appLocale.dinner,
      appLocale.snack,
    ];
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Scaffold(
        body: context.devicePadding(
          bottom: 0,
          context,
          child: SingleChildScrollView(
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
                Text(
                  appLocale.bestRecipesForYou,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: context.deviceHt * 0.08),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 8,
                    children: List.generate(filterOptions.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilterIndex = index;
                          });
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: index == selectedFilterIndex
                                ? Colors.black
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            border: index != selectedFilterIndex
                                ? Border.all(
                                    color: Colors.grey.shade400,
                                    width: 1,
                                  )
                                : null,
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              vertical: 8,
                              horizontal: 24,
                            ),
                            child: Text(
                              filterOptions[index],
                              style: TextStyle(
                                fontSize: 14,
                                color: index == selectedFilterIndex
                                    ? Colors.white
                                    : Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                AppSpacing.v26,
                SizedBox(
                  height: context.deviceHt * 0.315,
                  width: context.deviceWt,
                  child: ClipPath(
                    clipper: ButterflyShapeClipper(
                      butterflyBodyHeight: butterflyBodyHeight.value,
                      butterflyBodyWidth: butterflyBodyWidth.value,
                      butterWingWidth: butterWingWidth.value,
                    ),
                    child: Image.asset(
                      AppAssets.recipeSuggestion1,
                      fit: BoxFit.fill,
                    ),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          appLocale.recipeMeta,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    SFIcon(
                      SFIcons.sf_heart_fill,
                      color: Colors.grey.shade500,
                      fontSize: 20,
                    ),
                  ],
                ),
                AppSpacing.v20,
                SizedBox(
                  height: context.deviceHt * 0.3,
                  child: ClipPath(
                    clipper: WaveHeadClipper(waveHeight: waveHeight.value),
                    child: Image.asset(
                      AppAssets.recipeSuggestion2,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                AppSpacing.v22,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
