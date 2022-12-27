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
            alignment: AlignmentDirectional.topStart,
            children: [
              MapView(height: 300, coordinates: landmark.coordinates),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
                child: Center(child: CircleImage(image: landmark.image)),
              ),
              const SafeArea(
                child: CupertinoNavigationBarBackButton(
                  previousPageTitle: 'Landmarks',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                const Divider(),
                Text('About ${landmark.park}',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontSize: 22)),
                Flexible(
                  child: Text(landmark.description,
                      overflow: TextOverflow.fade,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(fontSize: 17)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
