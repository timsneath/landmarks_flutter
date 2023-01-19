import 'dart:ui';

class Segment {
  final Offset line;
  final Offset curve;
  final Offset control;

  const Segment({
    required this.line,
    required this.curve,
    required this.control,
  });
}

class HexagonParameters {
  static const adjustment = 0.085;

  static List<Segment> segments = [
    const Segment(
        line: Offset(0.60, 0.05),
        curve: Offset(0.40, 0.05),
        control: Offset(0.50, 0.00)),
    const Segment(
        line: Offset(0.05, 0.20 + adjustment),
        curve: Offset(0.00, 0.30 + adjustment),
        control: Offset(0.00, 0.25 + adjustment)),
    const Segment(
        line: Offset(0.00, 0.70 - adjustment),
        curve: Offset(0.05, 0.80 - adjustment),
        control: Offset(0.00, 0.75 - adjustment)),
    const Segment(
        line: Offset(0.40, 0.95),
        curve: Offset(0.60, 0.95),
        control: Offset(0.50, 1.00)),
    const Segment(
        line: Offset(0.95, 0.80 - adjustment),
        curve: Offset(1.00, 0.70 - adjustment),
        control: Offset(1.00, 0.75 - adjustment)),
    const Segment(
        line: Offset(1.00, 0.30 + adjustment),
        curve: Offset(0.95, 0.20 + adjustment),
        control: Offset(1.00, 0.25 + adjustment))
  ];
}
