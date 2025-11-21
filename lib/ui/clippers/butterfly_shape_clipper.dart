import 'package:flutter/material.dart';

class ButterflyShapeClipper extends CustomClipper<Path> {
  final double butterflyBodyHeight;
  final double butterWingWidth;
  final double butterflyBodyWidth;

  const ButterflyShapeClipper({
    this.butterflyBodyWidth = 0.5,
    this.butterflyBodyHeight = 0.75,
    this.butterWingWidth = 0.25,
  });

  @override
  Path getClip(Size size) {
    final Path leftWing = Path();

    final double bodyWidth = size.width * butterflyBodyWidth;
    final double wingWidth = size.width * butterWingWidth;
    final double bodyHeight = size.height * butterflyBodyHeight;
    final Size bodySize = Size(bodyWidth, bodyHeight);
    final double relativeTop = (size.height - bodySize.height) / 2;
    final topLeftRect = (Rect.fromLTWH(
      -wingWidth,
      relativeTop,
      wingWidth * 2,
      bodyHeight * 0.55,
    ));
    final bottomLeftRect = Rect.fromLTWH(
      -wingWidth,
      (bodyHeight * 0.45) + relativeTop,
      wingWidth * 2,
      bodyHeight * 0.55,
    );
    final centreLeftRect = Rect.fromLTWH(
      -wingWidth,
      (bodyHeight * 0.25) + relativeTop,
      wingWidth * 2,
      bodyHeight * 0.5,
    );
    leftWing.addOval(topLeftRect);
    leftWing.addOval(bottomLeftRect);
    leftWing.addRect(centreLeftRect);

    final Path rightWing = Path();

    final topRightRect = (Rect.fromLTWH(
      size.width - wingWidth,
      relativeTop,
      wingWidth * 2,
      bodyHeight * 0.55,
    ));
    final bottomRightRect = Rect.fromLTWH(
      size.width - wingWidth,
      (bodyHeight * 0.45) + relativeTop,
      wingWidth * 2,
      bodyHeight * 0.55,
    );
    final centreRightRect = Rect.fromLTWH(
      size.width - wingWidth,
      (bodyHeight * 0.25) + relativeTop,
      wingWidth * 2,
      bodyHeight * 0.5,
    );
    leftWing.addOval(topRightRect);
    leftWing.addOval(bottomRightRect);
    leftWing.addRect(centreRightRect);

    final Path body = Path();

    final bodyTop = Rect.fromCenter(
      center: Offset((size.width / 2), (bodyHeight * 0.3) + relativeTop),
      width: bodyWidth,
      height: bodyHeight * 0.6,
    );
    final bodyBottom = Rect.fromCenter(
      center: Offset(size.width / 2, (bodyHeight * 0.7) + relativeTop),
      width: bodyWidth,
      height: bodyHeight * 0.6,
    );
    final bodyCentre = Rect.fromCenter(
      center: Offset(size.width * 0.5, (bodyHeight * 0.5) + relativeTop),
      width: bodyWidth,
      height: bodyHeight * 0.5,
    );
    body.addOval(bodyTop);
    body.addOval(bodyBottom);
    body.addRect(bodyCentre);
    final wings = Path.combine(PathOperation.union, leftWing, rightWing);
    final butterfly = Path.combine(PathOperation.union, wings, body);
    return butterfly;
  }

  @override
  bool shouldReclip(covariant ButterflyShapeClipper oldClipper) {
    return oldClipper.butterflyBodyHeight != butterflyBodyHeight ||
        oldClipper.butterflyBodyWidth != butterflyBodyWidth ||
        oldClipper.butterWingWidth != butterWingWidth;
  }
}
