import 'package:flutter/cupertino.dart';
import 'package:landmarks/structures/range.dart';

import '../model/hikedata.dart';
import '../widgets/graph_capsule.dart';

class HikeGraph extends StatelessWidget {
  final Hike hike;

  const HikeGraph({super.key, required this.hike});

  @override
  Widget build(BuildContext context) {
    final seriesRange = hike.observations.map((e) => e.elevation).range();

    return Container(
      color: CupertinoColors.systemGrey,
      child: SizedBox(
        height: 200,
        child: Row(
          children: [
            for (var idx = 0; idx < hike.observations.length; idx++)
              GraphCapsule(
                  index: idx,
                  capsuleColor: CupertinoColors.inactiveGray,
                  height: 80,
                  range: hike.observations[idx].elevation,
                  overallRange: seriesRange)
          ],
        ),
      ),
    );
  }
}
