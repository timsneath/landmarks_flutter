import 'package:flutter/cupertino.dart';

import '../model/landmark.dart';
import 'landmark_row.dart';

class LandmarkList extends StatelessWidget {
  final List<Landmark> landmarks;

  const LandmarkList({super.key, required this.landmarks});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      semanticChildCount: landmarks.length,
      slivers: [
        CupertinoSliverNavigationBar(
          stretch: true,
          backgroundColor: CupertinoColors.extraLightBackgroundGray,
          border: null,
          largeTitle: Text('Landmarks'),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: CupertinoListSection.insetGrouped(children: [
            for (final landmark in landmarks) LandmarkRow(landmark: landmark),
          ]),
        ),
      ],
    );
  }
}
