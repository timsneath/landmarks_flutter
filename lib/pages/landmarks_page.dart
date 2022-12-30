import 'package:flutter/cupertino.dart';

import '../widgets/landmark_list.dart';

class LandmarksPage extends StatelessWidget {
  const LandmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: LandmarkList(),
    );
  }
}
