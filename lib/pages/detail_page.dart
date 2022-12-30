import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Divider;
import 'package:landmarks/widgets/favorite_button.dart';

import '../model/landmarks_model.dart';
import '../model/landmark.dart';
import '../widgets/circle_image.dart';
import '../widgets/map_view.dart';

class DetailPage extends StatelessWidget {
  final Landmark landmark;

  const DetailPage({super.key, required this.landmark});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(landmark.name),
        previousPageTitle: 'Landmarks',
      ),
      child: SingleChildScrollView(
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(landmark.name,
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .copyWith(fontSize: 25)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FavoriteButton(
                          isSet: landmark.isFavorite,
                          onTap: () {
                            LandmarksModel.of(context).updateLandmark(
                                landmark.id,
                                landmark.copyWith(
                                    isFavorite: !landmark.isFavorite));
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(landmark.park,
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .copyWith(
                                  fontSize: 15,
                                  color: CupertinoColors.systemGrey)),
                      const Spacer(),
                      Text(landmark.state,
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .copyWith(
                                  fontSize: 15,
                                  color: CupertinoColors.systemGrey)),
                    ],
                  ),
                  const Divider(),
                  Text('About ${landmark.name}',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(fontSize: 22)),
                  Flexible(
                    child: Text(landmark.description,
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
      ),
    );
  }
}
