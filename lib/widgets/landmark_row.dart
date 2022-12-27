import 'package:flutter/cupertino.dart';
import 'package:landmarks/widgets/content_view.dart';

import '../model/landmark.dart';

class LandmarkRow extends StatelessWidget {
  final Landmark landmark;

  const LandmarkRow({super.key, required this.landmark});

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ContentView(landmark: landmark),
            )),
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
