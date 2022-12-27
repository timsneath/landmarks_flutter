import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/landmark.dart';
import 'circle_image.dart';
import 'map_view.dart';

class ContentView extends StatelessWidget {
  final Landmark landmark;

  const ContentView({super.key, required this.landmark});

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
                Text(landmark.name,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontSize: 25)),
                Row(
                  children: [
                    Text(landmark.park,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                                fontSize: 15,
                                color: CupertinoColors.secondaryLabel)),
                    const Spacer(),
                    Text(landmark.state,
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
                Text(landmark.description,
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
