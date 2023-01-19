import 'dart:math' show min;

import 'package:flutter/cupertino.dart';
import 'package:landmarks/widgets/hexagon_parameters.dart';

class BadgeBackground extends CustomPainter {
  LinearGradient fill = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 239, 120, 221),
      Color.fromARGB(255, 239, 172, 120),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final paintColor = Paint()
      ..shader = fill.createShader(rect)
      ..style = PaintingStyle.fill;

    final width = min(size.height, size.width);
    final height = width;
    const xScale = 0.832;
    final xOffset = (width * (1.0 - xScale)) / 2.0;

    final path = Path()
      ..moveTo(width * 0.95 + xOffset,
          height * (0.20 + HexagonParameters.adjustment));
    for (final segment in HexagonParameters.segments) {
      path.lineTo(segment.line.dx, segment.line.dy);
      path.quadraticBezierTo(
          width * segment.curve.dx + xOffset,
          height * segment.curve.dy,
          width * segment.control.dx + xOffset,
          height * segment.control.dy);
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
      child: Container(),
    );
  }
}
