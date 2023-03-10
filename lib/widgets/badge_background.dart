import 'dart:math' show min;

import 'package:flutter/cupertino.dart';
import 'package:landmarks/widgets/badge_symbol.dart';

import 'hexagon_parameters.dart';

class BadgeBackground extends CustomPainter {
  LinearGradient fill = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 239, 120, 221),
      Color.fromARGB(255, 239, 172, 120),
    ],
    begin: Alignment(0, -1), // SwiftUI range is [0, 1]; Flutter is [-1, 1]
    end: Alignment(0, -0.3),
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final paintColor = Paint()
      ..shader = fill.createShader(rect)
      ..style = PaintingStyle.fill;

    const xScale = 0.832;
    final height = min(size.height, size.width);
    final width = height * xScale;
    final xOffset = (width * (1.0 - xScale)) / 2.0;

    final path = Path()
      ..moveTo(width * 0.95 + xOffset,
          height * (0.20 + HexagonParameters.adjustment));
    for (final segment in HexagonParameters.segments) {
      path.lineTo(width * segment.line.dx + xOffset, height * segment.line.dy);

      // Control and endpoint are inverted compared to SwiftUI
      path.quadraticBezierTo(
        width * segment.control.dx + xOffset,
        height * segment.control.dy,
        width * segment.curve.dx + xOffset,
        height * segment.curve.dy,
      );
    }

    canvas.drawPath(path, paintColor);
  }

  @override
  bool shouldRepaint(BadgeBackground oldDelegate) => false;
}

class Badge extends StatelessWidget {
  const Badge({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BadgeBackground(),
      foregroundPainter: BadgeSymbol(),
      child: Container(),
    );
  }
}
