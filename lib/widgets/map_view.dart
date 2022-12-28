import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../model/landmark.dart';

class MapView extends StatelessWidget {
  final double? height;
  final Coordinates coordinates;

  const MapView({super.key, this.height, required this.coordinates});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AppleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(coordinates.latitude, coordinates.longitude),
          zoom: 10,
        ),
      ),
    );
  }
}
