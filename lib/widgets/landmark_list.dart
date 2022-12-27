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
          largeTitle: Text('Landmarks'),
        ),
        SliverSafeArea(
          top: false,
          minimum: const EdgeInsets.only(top: 8),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index < landmarks.length) {
                  return LandmarkRow(landmark: landmarks[index]);
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
