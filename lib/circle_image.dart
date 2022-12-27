import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
              blurRadius: 10,
              color: CupertinoColors.systemGrey2,
              spreadRadius: 2)
        ],
      ),
      width: 200,
      height: 200,
      child: CircleAvatar(
        radius: 100,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 96.5,
          backgroundImage: AssetImage('assets/turtlerock.jpg'),
        ),
      ),
    );
  }
}
