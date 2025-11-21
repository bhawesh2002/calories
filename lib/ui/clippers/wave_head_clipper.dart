import 'package:flutter/material.dart';
import 'dart:math' as math;

class WaveHeadClipper extends CustomClipper<Path> {
  final double radius = 12;
  final int waveCount;
  final double waveHeight;

  WaveHeadClipper({this.waveCount = 4, this.waveHeight = 1.0});
  @override
  Path getClip(Size size) {
    final Path waves = Path();
    final double waveWidth = size.width / waveCount;
    final double waveHt = size.height * waveHeight;

    for (var i = 0; i < waveCount; i++) {
      final rect = Rect.fromCenter(
        center: Offset(0 + (waveWidth * i), size.height * 0.5),
        width: waveWidth * 2,
        height: waveHt,
      );
      waves.addArc(rect, -math.pi / 2, math.pi);
    }

    final Path body = Path();

    body.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height * 0.75),
          width: size.width,
          height: size.height * 0.5,
        ),
        Radius.circular(radius),
      ),
    );

    final Path waveBody = Path.combine(PathOperation.union, body, waves);

    final clippedBody = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
          bottomLeft: Radius.circular(radius),
        ),
      );

    final Path clippedPath = Path.combine(
      PathOperation.intersect,
      clippedBody,
      waveBody,
    );
    return clippedPath;
  }

  @override
  bool shouldReclip(covariant WaveHeadClipper oldClipper) {
    return true;
  }
}
