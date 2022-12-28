import 'package:flutter/cupertino.dart';

class CircleImage extends StatelessWidget {
  final String image;
  const CircleImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: CupertinoColors.white, width: 4),
        boxShadow: const [
          BoxShadow(blurRadius: 7, color: CupertinoColors.systemGrey)
        ],
      ),
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: ClipOval(
          child: Image.asset(image),
        ),
      ),
    );
  }
}
