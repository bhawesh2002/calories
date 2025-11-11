import 'package:flutter/material.dart';
import 'dart:math' as math;

class TripleCircleClipper extends CustomClipper<Path> {
  final double hemisphereDistance;
  TripleCircleClipper({this.hemisphereDistance = 0.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    double arcDistance = 0;
    double rectWidth = size.width;
    for (var i = 0; i < 3; i++) {
      path.addArc(
        Rect.fromLTWH(
          arcDistance + hemisphereDistance,
          0,
          rectWidth,
          size.height,
        ),
        -math.pi / 2,
        -math.pi,
      );
      arcDistance += (rectWidth / 2) + hemisphereDistance;
      rectWidth = (rectWidth / 2) * 1.23;
    }

    return path;
  }

  @override
  bool shouldReclip(covariant TripleCircleClipper oldClipper) => true;
  // oldClipper.hemisphereDistance != hemisphereDistance;
}
