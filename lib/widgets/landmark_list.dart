import 'package:flutter/cupertino.dart';

import '../model/landmark.dart';
import 'landmark_row.dart';

class LandmarkList extends StatefulWidget {
  final List<Landmark> landmarks;
  final bool showFavoritesOnly;

  const LandmarkList(
      {super.key, required this.landmarks, required this.showFavoritesOnly});

  @override
  State<LandmarkList> createState() => _LandmarkListState();
}

class _LandmarkListState extends State<LandmarkList> {
  late final Iterable<Landmark> filteredLandmarks;

  @override
  void initState() {
    super.initState();
    filteredLandmarks = widget.showFavoritesOnly
        ? widget.landmarks.where((element) => element.isFavorite)
        : widget.landmarks;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      semanticChildCount: widget.landmarks.length,
      slivers: [
        CupertinoSliverNavigationBar(
          stretch: true,
          border: null,
          largeTitle: Text('Landmarks'),
          backgroundColor: CupertinoColors.systemGroupedBackground,
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: CupertinoListSection.insetGrouped(children: [
            for (final landmark in filteredLandmarks)
              LandmarkRow(landmark: landmark),
          ]),
        ),
      ],
    );
  }
}
