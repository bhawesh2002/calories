import 'package:calories/recipe/widgets/circle_guage_painter.dart';
import 'package:flutter/material.dart';

class CircleGuage extends StatefulWidget {
  final double completed;
  final String title;
  final String subtitle;
  final Color color = Colors.transparent;
  final Color strokeColor = Colors.black;
  final double strokeWidth = 1;
  final StrokeCap strokeCap = StrokeCap.round;

  const CircleGuage({
    super.key,
    required this.completed,
    required this.title,
    required this.subtitle,
  });

  @override
  State<CircleGuage> createState() => _CircleGuageState();
}

class _CircleGuageState extends State<CircleGuage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  Animation<double>? completionAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    startCompleteAnimation();
    super.initState();
  }

  void startCompleteAnimation() {
    completionAnimation =
        Tween<double>(
          begin: completionAnimation != null ? completionAnimation?.value : 0,
          end: widget.completed,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeInOutCirc,
          ),
        );
    animationController.forward(from: 0.0);
  }

  @override
  void didUpdateWidget(covariant CircleGuage oldWidget) {
    if (oldWidget.completed != widget.completed) startCompleteAnimation();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxHeight / 2;
        return AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: CircleGuagePainter(
                radius: radius,
                strokeWidth: 2,
                completed: completionAnimation!.value,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: radius * 0.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: radius * 0.2,
                        height: 0.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
