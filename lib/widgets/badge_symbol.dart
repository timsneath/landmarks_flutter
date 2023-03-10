import 'dart:math' show min, pi;

import 'package:flutter/cupertino.dart';

class BadgeSymbol extends CustomPainter {
  static const symbolColor = Color.fromARGB(127, 79, 79, 191);

  @override
  void paint(Canvas canvas, Size size) {
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

    for (var i = 0; i < 8; i++) {
      canvas
        ..save()
        ..translate(middle, middle)
        ..rotate((2 * pi) / (8 / i))
        ..scale(0.33)
        ..translate(-middle, -middle)
        ..translate(0, -.5 * height)
        ..drawPath(path, paintColor)
        ..restore();
    }
  }

  @override
  bool shouldRepaint(BadgeSymbol oldDelegate) => false;
}
