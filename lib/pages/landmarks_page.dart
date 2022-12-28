import 'package:flutter/cupertino.dart';

import '../model/landmark.dart';
import '../widgets/landmark_list.dart';

class LandmarksPage extends StatelessWidget {
  final List<Landmark> landmarks;

  const LandmarksPage({super.key, required this.landmarks});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      child: LandmarkList(landmarks: landmarks),
    );
  }
}
