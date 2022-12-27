import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final AssetImage image;
  const CircleImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(blurRadius: 7, color: CupertinoColors.systemGrey)
        ],
      ),
      width: 200,
      height: 200,
      child: CircleAvatar(
        radius: 100,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 96.5,
          backgroundImage: image,
        ),
      ),
    );
  }
}
