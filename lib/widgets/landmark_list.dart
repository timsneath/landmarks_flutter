import 'package:flutter/cupertino.dart';

import '../model/landmarks_model.dart';
import '../model/landmark.dart';
import 'landmark_row.dart';

class LandmarkList extends StatefulWidget {
  const LandmarkList({super.key});

  @override
  State<LandmarkList> createState() => _LandmarkListState();
}

class _LandmarkListState extends State<LandmarkList> {
  late bool showFavoritesOnly;

  @override
  void initState() {
    super.initState();
    showFavoritesOnly = false;
  }

  Iterable<Landmark> filteredLandmarks(Iterable<Landmark> landmarks) =>
      showFavoritesOnly
          ? landmarks.where((element) => element.isFavorite)
          : landmarks;

  @override
  Widget build(BuildContext context) {
    final landmarks = LandmarksModel.of(context).landmarks;

    return CustomScrollView(
      semanticChildCount: landmarks.length,
      slivers: [
        const CupertinoSliverNavigationBar(
          stretch: true,
          border: null,
          largeTitle: Text('Landmarks'),
          backgroundColor: CupertinoColors.systemGroupedBackground,
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: CupertinoListSection.insetGrouped(children: [
            CupertinoListTile(
              title: const Text('Favorites only'),
              trailing: CupertinoSwitch(
                value: showFavoritesOnly,
                onChanged: (bool value) {
                  setState(() {
                    showFavoritesOnly = value;
                  });
                },
              ),
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20, vertical: 4),
            ),
            for (final landmark in filteredLandmarks(landmarks))
              LandmarkRow(landmark: landmark),
          ]),
        ),
      ],
    );
  }
}
