import 'package:flutter/cupertino.dart';

import 'landmark.dart';

class InheritedLandmarksModel extends InheritedWidget {
  final LandmarksModelState data;

  const InheritedLandmarksModel(
      {super.key, required super.child, required this.data});

  @override
  bool updateShouldNotify(InheritedLandmarksModel oldWidget) => true;
}

class LandmarksModel extends StatefulWidget {
  final Widget child;
  final List<Landmark> landmarks;

  const LandmarksModel(
      {super.key, required this.child, required this.landmarks});

  static LandmarksModelState of(BuildContext context) {
    final inheritedModelData =
        context.dependOnInheritedWidgetOfExactType<InheritedLandmarksModel>();
    return inheritedModelData?.data ?? LandmarksModelState();
  }

  @override
  State<LandmarksModel> createState() => LandmarksModelState();
}

class LandmarksModelState extends State<LandmarksModel> {
  late final List<Landmark> landmarks;

  @override
  void initState() {
    super.initState();
    landmarks = widget.landmarks;
  }

  void updateLandmark(int id, Landmark landmark) {
    final idx = landmarks.indexWhere((element) => element.id == id);
    if (idx != -1) {
      setState(() {
        landmarks[idx] = landmark;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedLandmarksModel(data: this, child: widget.child);
  }
}
