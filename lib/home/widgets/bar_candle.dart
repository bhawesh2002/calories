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

class _BarCandleState extends State<BarCandle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
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
        AppSpacing.v4,
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return CustomPaint(
                size: Size(constraints.maxHeight, constraints.maxWidth),
                painter: BarCandlePainter(
                  completed: widget.completed,
                  spacing: widget.spacing,
                  angle: widget.angle,
                  color: widget.color,
                  lineWidth: widget.lineWidth,
                  radius: widget.radius,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
