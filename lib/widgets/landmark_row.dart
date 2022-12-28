import 'package:flutter/cupertino.dart';

import '../model/landmark.dart';
import '../pages/detail_page.dart';

class LandmarkRow extends StatelessWidget {
  final Landmark landmark;

  const LandmarkRow({super.key, required this.landmark});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => DetailPage(landmark: landmark),
          )),
      child: CupertinoFormRow(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                  height: 50, width: 50, child: Image(image: landmark.image)),
            ),
            Text(landmark.name),
          ],
        ),
      ),
    );
  }
}
