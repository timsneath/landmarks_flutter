import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landmarks/circle_image.dart';
import 'package:landmarks/landmark.dart';
import 'package:landmarks/landmark_row.dart';
import 'package:landmarks/map_view.dart';

final landmarks = <Landmark>{};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final data = await rootBundle.loadString('assets/landmark_data.json');
  landmarks.addAll(
      List<Landmark>.from(json.decode(data).map((x) => Landmark.fromJson(x))));

  runApp(const LandmarksApp());
}

class LandmarksApp extends StatelessWidget {
  const LandmarksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: PreviewProvider(),
    );
  }
}

class PreviewProvider extends StatelessWidget {
  const PreviewProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: LandmarkRow(landmark: landmarks.first),
      ),
    );
  }
}

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: const [
              MapView(height: 300),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 170, 0, 0),
                child: CircleImage(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(landmarks.last.name,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontSize: 25)),
                Row(
                  children: [
                    Text('Joshua Tree National Park',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                                fontSize: 15,
                                color: CupertinoColors.secondaryLabel)),
                    const Spacer(),
                    Text('California',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                                fontSize: 15,
                                color: CupertinoColors.secondaryLabel)),
                  ],
                ),
                Divider(),
                Text('About Turtle Rock',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontSize: 22)),
                Text('Descriptive text goes here.',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontSize: 17)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
