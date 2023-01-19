import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:landmarks/model/landmarks_model.dart';

import 'model/landmark.dart';
import 'widgets/badge_background.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final data = await rootBundle.loadString('assets/landmark_data.json');
  final initialLandmarks =
      List<Landmark>.from(json.decode(data).map((x) => Landmark.fromJson(x)));

  runApp(LandmarksModel(
    landmarks: initialLandmarks,
    child: const LandmarksApp(),
  ));
}

class LandmarksApp extends StatelessWidget {
  const LandmarksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: Badge(),
    );
  }
}
