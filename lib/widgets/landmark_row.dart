import 'package:flutter/cupertino.dart';

import '../model/landmark.dart';

class LandmarkRow extends StatelessWidget {
  final Landmark landmark;

  const LandmarkRow({super.key, required this.landmark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(height: 50, width: 50, child: landmark.image),
        ),
        Text(landmark.name),
      ],
    );
  }
}
