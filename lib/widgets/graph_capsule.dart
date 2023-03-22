import 'dart:math' show max;

import 'package:flutter/cupertino.dart';

import '../structures/range.dart';

class GraphCapsule extends StatelessWidget {
  final int index;
  final Color capsuleColor;
  final double height;
  final Range<double> range;
  final Range<double> overallRange;

  double get heightRatio => max(range.magnitude / overallRange.magnitude, 0.15);
  double get offsetRatio =>
      (range.from - overallRange.from) / overallRange.magnitude;
  double get padding => height * offsetRatio;

  double get heightRatio2 => overallRange.magnitude / height;

  double get paddingTop => (overallRange.to - range.to) * heightRatio2;
  double get paddingBottom => (overallRange.from - range.from) * heightRatio2;

  const GraphCapsule(
      {super.key,
      required this.index,
      required this.capsuleColor,
      required this.height,
      required this.range,
      required this.overallRange});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, paddingTop, 0, paddingBottom),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: index % 2 == 0
                ? CupertinoColors.activeBlue
                : CupertinoColors.activeGreen,
          ),
        ),
      ),
    );
  }
}
