import 'dart:math' show max;

import 'package:flutter/cupertino.dart';

import '../structures/range.dart';

class GraphCapsule extends StatelessWidget {
  final int index;
  final Color capsuleColor;
  final double height;
  final Range<double> range;
  final Range<double> overallRange;

  double get heightRatio => height / overallRange.magnitude;
  double get paddingTop => (overallRange.to - range.to) * heightRatio;
  double get paddingBottom => (range.from - overallRange.from) * heightRatio;

  const GraphCapsule(
      {super.key,
      required this.index,
      required this.capsuleColor,
      required this.height,
      required this.range,
      required this.overallRange});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        // height: range.magnitude * heightRatio,
        child: Container(
          color: index % 2 == 0
              ? CupertinoColors.activeBlue
              : CupertinoColors.activeGreen,
          margin: EdgeInsets.fromLTRB(0, paddingTop, 0, paddingBottom),
        ),
      ),
    );
  }
}
