import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmarks/circle_image.dart';
import 'package:landmarks/map_view.dart';

void main() {
  runApp(const LandmarksApp());
}

class LandmarksApp extends StatelessWidget {
  const LandmarksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: ContentView(),
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Turtle Rock',
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
