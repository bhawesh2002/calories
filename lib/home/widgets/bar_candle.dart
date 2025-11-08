import 'package:calories/home/widgets/bar_candle_painter.dart';
import 'package:calories/utils/app_spacing.dart';
import 'package:flutter/material.dart';

class BarCandle extends StatefulWidget {
  final String title;
  final String subtitle;
  final double completed;
  final Color color;
  final double radius;
  final double spacing;
  final double angle;
  final double lineWidth;
  const BarCandle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.completed,
    this.color = Colors.tealAccent,
    this.spacing = 8,
    this.angle = -90,
    this.radius = 12,
    this.lineWidth = 1,
  });

  @override
  State<BarCandle> createState() => _BarCandleState();
}

class _BarCandleState extends State<BarCandle>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  Animation<Size>? sizeAnim;
  Animation<double>? completedAnim;

  BoxConstraints? _constraints;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    setSizeAnim();

    super.initState();
  }

  void setSizeAnim() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_constraints != null) {
        sizeAnim ??=
            Tween<Size>(
              begin: Size(_constraints!.maxWidth, 0),
              end: Size(_constraints!.maxWidth, _constraints!.maxHeight),
            ).animate(
              CurvedAnimation(
                parent: animationController,
                curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
              ),
            );
        completedAnim ??= Tween<double>(begin: 0, end: widget.completed)
            .animate(
              CurvedAnimation(
                parent: animationController,
                curve: Interval(0.65, 1.0, curve: Curves.easeInOut),
              ),
            );
        animationController.forward();
      } else {
        setSizeAnim();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedOpacity(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 300),
              opacity: animationController.isCompleted ? 1 : 0,
              child: RichText(
                text: TextSpan(
                  text: widget.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: widget.subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.v6,
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  _constraints = constraints;
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        animationController.forward(from: 0.0);
                      },
                      child: SizedBox(
                        width: constraints.maxWidth,
                        height: sizeAnim?.value.height ?? 0,
                        child: CustomPaint(
                          painter: BarCandlePainter(
                            completed: widget.completed,
                            spacing: widget.spacing,
                            angle: widget.angle,
                            color: widget.color,
                            lineWidth: widget.lineWidth,
                            radius: widget.radius,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
