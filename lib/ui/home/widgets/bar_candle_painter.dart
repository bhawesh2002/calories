import 'package:flutter/material.dart';
import 'dart:math' as math;

class BarCandlePainter extends CustomPainter {
  final double completed;
  final Color color;
  final double radius;
  final double spacing;
  final double angle;
  final double lineWidth;
  BarCandlePainter({
    required this.completed,
    this.color = Colors.tealAccent,
    this.spacing = 12,
    this.angle = 30 * math.pi / 180,
    this.radius = 12,
    this.lineWidth = 1,
  }) : assert(
         (!(completed < 0) && !(completed > 1)),
         "completed can be in between 0 and 1",
       );

  @override
  void paint(Canvas canvas, Size size) {
    final barHeight = size.height;
    final barWidth = size.width;
    final completedHeight = barHeight * (1 - completed);

    final Paint solidPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Paint linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    canvas.clipRRect(
      RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(radius)),
    );

    for (var i = -size.height / 2; i < size.height * 2; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i + angle), linePaint);
    }

    final Rect barRect = Rect.fromLTWH(
      0,
      completedHeight,
      barWidth,
      barHeight - completedHeight,
    );

    final RRect roundedRect = RRect.fromRectAndRadius(
      barRect,
      Radius.circular(radius),
    );
    canvas.drawRRect(roundedRect, solidPaint);
  }

  @override
  bool shouldRepaint(covariant BarCandlePainter oldDelegate) {
    return oldDelegate.completed != completed ||
        oldDelegate.color != color ||
        oldDelegate.spacing != spacing ||
        oldDelegate.angle != angle ||
        oldDelegate.lineWidth != lineWidth ||
        oldDelegate.radius != radius;
  }
}
