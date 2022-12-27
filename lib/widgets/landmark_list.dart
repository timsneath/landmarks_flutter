import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/landmark.dart';

import 'landmark_row.dart';

class LandmarkList extends StatelessWidget {
  final List<Landmark> landmarks;

  const LandmarkList({super.key, required this.landmarks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => LandmarkRow(landmark: landmarks[index]),
      itemCount: landmarks.length,
      separatorBuilder: (context, index) => Divider(
        color: CupertinoColors.opaqueSeparator,
      ),
    );
  }
}
