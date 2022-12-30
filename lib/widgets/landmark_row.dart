import 'package:flutter/cupertino.dart';

import '../model/landmark.dart';
import '../pages/detail_page.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Icon(
        CupertinoIcons.star_fill,
        color: CupertinoColors.systemYellow,
      ),
    );
  }
}

class LandmarkRow extends StatelessWidget {
  final Landmark landmark;

  const LandmarkRow({super.key, required this.landmark});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => DetailPage(landmark: landmark),
        ),
      ),
      leading: Image.asset(landmark.image),
      leadingSize: 50,
      leadingToTitle: 12,
      title: Text(landmark.name,
          style: CupertinoTheme.of(context)
              .textTheme
              .textStyle
              .copyWith(letterSpacing: -0.15)),
      trailing: Row(children: [
        if (landmark.isFavorite) const FavoriteIcon(),
        const CupertinoListTileChevron(),
      ]),
    );
  }
}
