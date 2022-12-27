import 'package:flutter/cupertino.dart';

class Landmark {
  final int id;
  final String name;
  final String park;
  final String state;
  final String description;
  final String imageName;
  final Coordinates coordinates;

  AssetImage get image => AssetImage('assets/$imageName@2x.jpg');

  const Landmark(this.id, this.name, this.park, this.state, this.description,
      this.imageName, this.coordinates);

  Landmark.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        park = json['park'],
        state = json['state'],
        description = json['description'],
        imageName = json['imageName'],
        coordinates = Coordinates.fromJson(json['coordinates']);
}

class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates(this.latitude, this.longitude);

  Coordinates.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'],
        longitude = json['longitude'];
}
