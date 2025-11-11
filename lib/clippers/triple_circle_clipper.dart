import 'package:flutter/material.dart';
import 'dart:math' as math;

class TripleCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.addArc(
      Rect.fromLTRB(0, 0, size.width, size.height),
      -math.pi / 2,
      -math.pi,
    );
    path.addArc(
      Rect.fromPoints(
        Offset(size.width * 0.5, 0),
        Offset(size.width * 1.1, size.height),
      ),
      -math.pi / 2,
      -math.pi,
    );
    path.addArc(
      Rect.fromPoints(
        Offset(size.width * 0.8, 0),
        Offset(size.width * 1.2, size.height),
      ),
      -math.pi / 2,
      -math.pi,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
