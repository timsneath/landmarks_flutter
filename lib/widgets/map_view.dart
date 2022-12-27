import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:flutter/cupertino.dart';

class MapView extends StatelessWidget {
  final double height;
  const MapView({super.key, this.height = 300});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AppleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(34.011286, -116.166868),
          zoom: 10,
        ),
      ),
    );
  }
}
