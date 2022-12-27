import 'package:flutter/cupertino.dart';

void main() {
  runApp(const LandmarksApp());
}

class LandmarksApp extends StatelessWidget {
  const LandmarksApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: ContentView(),
    );
  }
}

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
