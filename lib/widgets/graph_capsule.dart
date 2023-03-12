import 'package:flutter/cupertino.dart';

import '../structures/range.dart';

class GraphCapsule extends StatelessWidget {
  final int index;
  final Color capsuleColor;
  final double height;
  final Range<double> range;
  final Range<double> overallRange;

  double get heightRatio =>
      //  max(
      range.magnitude / overallRange.magnitude
      // , 0.15)
      ;
  double get offsetRatio =>
      (range.from - overallRange.from) / overallRange.magnitude;
  double get padding => height * -offsetRatio;
  double get paddingTop => padding > 0 ? padding : 0;
  double get paddingBottom => padding < 0 ? -padding : 0;

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
      child: Container(
        height: height * heightRatio,
        color: index % 2 == 0
            ? CupertinoColors.activeBlue
            : CupertinoColors.activeGreen,
        margin: EdgeInsets.fromLTRB(0, paddingTop, 0, paddingBottom),
      ),
    );
  }
}
