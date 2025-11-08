import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleGuagePainter extends CustomPainter {
  final double completed;
  final double radius;
  final Color color;
  final Color strokeColor;
  final double strokeWidth;
  final StrokeCap strokeCap;

  CircleGuagePainter({
    super.repaint,
    required this.completed,
    required this.radius,
    this.color = Colors.transparent,
    this.strokeColor = Colors.black,
    this.strokeWidth = 1,
    this.strokeCap = StrokeCap.round,
  }) : assert(
         (!(completed < 0) && !(completed > 1)),
         "completed can be in between 0 and 1",
       );

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius,
      circlePaint,
    );
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2 - strokeWidth, size.height / 2),
        radius: radius,
      ),
      -math.pi / 2,
      math.pi * (completed * 2),
      false,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
