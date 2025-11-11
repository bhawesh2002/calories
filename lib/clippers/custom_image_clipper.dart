import 'package:flutter/material.dart';
import 'dart:math' as math;

enum CustomClipVarient { varient1, varient2, varient3 }

class CustomImageClipper extends CustomClipper<Path> {
  final CustomClipVarient clipVairent;
  CustomImageClipper({required this.clipVairent});
  factory CustomImageClipper.v1() =>
      CustomImageClipper(clipVairent: CustomClipVarient.varient1);

  Path _getPathVarient1(Size size) {
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

  Path _getPath(Size size) {
    if (clipVairent == CustomClipVarient.varient1) {
      return _getPathVarient1(size);
    }
    return Path();
  }

  @override
  Path getClip(Size size) {
    final Path path = _getPath(size);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
