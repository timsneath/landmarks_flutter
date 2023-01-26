import 'dart:math' show min, pi;

import 'package:flutter/cupertino.dart';

class BadgeSymbol extends CustomPainter {
  static const symbolColor = Color.fromARGB(127, 79, 79, 191);

  void drawSymbol(Canvas canvas, Size size, double angle) {
    final width = min(size.height, size.width);
    final height = width * 0.75;
    final spacing = width * 0.030;
    final middle = width * 0.5;
    final topWidth = width * 0.226;
    final topHeight = height * 0.488;

    final paintColor = Paint()
      ..color = symbolColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(middle, spacing)
      ..lineTo(middle - topWidth, topHeight - spacing)
      ..lineTo(middle, (topHeight / 2) + spacing)
      ..lineTo(middle + topWidth, topHeight - spacing)
      ..lineTo(middle, spacing)
      ..moveTo(middle, (topHeight / 2) + (spacing * 3))
      ..lineTo(middle - topWidth, topHeight + spacing)
      ..lineTo(spacing, height - spacing)
      ..lineTo(width - spacing, height - spacing)
      ..lineTo(middle + topWidth, topHeight + spacing)
      ..lineTo(middle, (topHeight / 2) + (spacing * 3));
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < 8; i++) {
      const rotationEpsilon = 2 * pi / 8;
      canvas
        ..save()
        ..translate(middle, middle)
        ..rotate(rotationEpsilon * i)
        ..scale(0.25)
        // ..translate(-width / 8, (0.15 * height))
        ..drawPath(path, paintColor)
        ..translate(-middle, -middle)
        ..restore();
    }
  }

  @override
  bool shouldRepaint(BadgeSymbol oldDelegate) => false;
}
