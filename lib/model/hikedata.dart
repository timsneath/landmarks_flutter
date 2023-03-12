import 'package:intl/intl.dart';

import '../structures/range.dart';

class Hike {
  final int id;
  final String name;
  final double distance;
  final int difficulty;
  final List<Observation> observations;

  const Hike(
      this.id, this.name, this.distance, this.difficulty, this.observations);

  String get distanceText => '${NumberFormat('###,###.00').format(distance)}km';

  Hike.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData['id'],
        name = jsonData['name'],
        distance = jsonData['distance'],
        difficulty = jsonData['difficulty'],
        observations = List<Observation>.from(
            jsonData['observations'].map((ob) => Observation.fromJson(ob)));
}

class Observation {
  final double distanceFromStart;
  final Range<double> elevation;
  final Range<double> pace;
  final Range<double> heartRate;

  const Observation(
      this.distanceFromStart, this.elevation, this.pace, this.heartRate);

  Observation.fromJson(Map<String, dynamic> jsonData)
      : distanceFromStart = (jsonData['distanceFromStart']).toDouble(),
        elevation = Range.fromList(List<double>.from(jsonData['elevation'])),
        pace = Range.fromList(List<double>.from(jsonData['pace'])),
        heartRate = Range.fromList(List<double>.from(jsonData['heartRate']));
}
