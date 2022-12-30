class Landmark {
  final int id;
  final String name;
  final String park;
  final String state;
  final String description;
  final Coordinates coordinates;
  final bool isFavorite;

  final String _imageName;
  String get image => 'assets/$_imageName@2x.jpg';

  const Landmark(this.id, this.name, this.park, this.state, this.description,
      this._imageName, this.isFavorite, this.coordinates);

  Landmark.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        park = json['park'],
        state = json['state'],
        description = json['description'],
        _imageName = json['imageName'],
        isFavorite = json['isFavorite'],
        coordinates = Coordinates.fromJson(json['coordinates']);

  Landmark copyWith(
      {int? id,
      String? name,
      String? park,
      String? state,
      String? description,
      String? imageName,
      Coordinates? coordinates,
      bool? isFavorite}) {
    return Landmark(
        id ?? this.id,
        name ?? this.name,
        park ?? this.park,
        state ?? this.state,
        description ?? this.description,
        imageName ?? _imageName,
        isFavorite ?? this.isFavorite,
        coordinates ?? this.coordinates);
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates(this.latitude, this.longitude);

  Coordinates.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'],
        longitude = json['longitude'];
}
