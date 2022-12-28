import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'model/landmark.dart';
import 'pages/landmarks_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final data = await rootBundle.loadString('assets/landmark_data.json');
  final landmarks =
      List<Landmark>.from(json.decode(data).map((x) => Landmark.fromJson(x)));

  runApp(LandmarksApp(landmarks: landmarks));
}

class LandmarksApp extends StatelessWidget {
  final List<Landmark> landmarks;

  const LandmarksApp({super.key, required this.landmarks});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: LandmarksPage(landmarks: landmarks),
    );
  }
}
