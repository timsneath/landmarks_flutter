import 'package:flutter/cupertino.dart';

import '../model/landmark.dart';

import 'landmark_row.dart';

class LandmarkList extends StatelessWidget {
  final List<Landmark> landmarks;

  const LandmarkList({super.key, required this.landmarks});

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      header: Text('Landmarks',
          style: CupertinoTheme.of(context)
              .textTheme
              .textStyle
              .copyWith(fontSize: 34, fontWeight: FontWeight.bold)),
      children:
          landmarks.map((landmark) => LandmarkRow(landmark: landmark)).toList(),
    );
  }
}
