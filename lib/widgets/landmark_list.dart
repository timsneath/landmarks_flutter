import 'package:flutter/cupertino.dart';

import '../model/landmark.dart';
import 'landmark_row.dart';

class LandmarkList extends StatefulWidget {
  final List<Landmark> landmarks;

  const LandmarkList({super.key, required this.landmarks});

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

  Iterable<Landmark> filteredLandmarks() => showFavoritesOnly
      ? widget.landmarks.where((element) => element.isFavorite)
      : widget.landmarks;

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
            CupertinoListTile(
              title: Text('Favorites only'),
              trailing: CupertinoSwitch(
                value: showFavoritesOnly,
                onChanged: (bool value) {
                  setState(() {
                    showFavoritesOnly = value;
                  });
                },
              ),
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 4),
            ),
            for (final landmark in filteredLandmarks())
              LandmarkRow(landmark: landmark),
          ]),
        ),
      ],
    );
  }
}
