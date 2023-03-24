import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'model/hikedata.dart';
import 'model/landmark.dart';
import 'model/landmarks_model.dart';
import 'structures/range.dart';
import 'widgets/hike_graph.dart';

final hikes = <Hike>[];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final landmarkData = await rootBundle.loadString('assets/landmark_data.json');
  final initialLandmarks = List<Landmark>.from(
      json.decode(landmarkData).map((x) => Landmark.fromJson(x)));
  final hikeData = await rootBundle.loadString('assets/hike_data.json');
  hikes.addAll(
      List<Hike>.from(json.decode(hikeData).map((x) => Hike.fromJson(x))));

  runApp(LandmarksModel(
    landmarks: initialLandmarks,
    child: const LandmarksApp(),
  ));
}

class LandmarksApp extends StatelessWidget {
  const LandmarksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: SafeArea(
        child: CupertinoPageScaffold(
            child: HikeGraph(
                hike: Hike(0, 'Test', 3.0, 1, [
          Observation(0, Range(400, 800), Range(100, 300), Range(100, 300)),
          Observation(0, Range(0, 800), Range(100, 300), Range(100, 300)),
          Observation(0, Range(400, 600), Range(100, 300), Range(100, 300)),
        ]))),
      ),
    );
  }
}
