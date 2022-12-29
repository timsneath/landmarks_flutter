import 'package:flutter/cupertino.dart';

class FavoriteButton extends StatefulWidget {
  final bool isSet;

  const FavoriteButton({super.key, required this.isSet});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool isSet;

  @override
  void initState() {
    super.initState();
    isSet = widget.isSet;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: isSet
            ? const Icon(CupertinoIcons.star_fill,
                color: CupertinoColors.systemYellow)
            : const Icon(CupertinoIcons.star,
                color: CupertinoColors.systemGrey),
        onTap: () => setState(() {
              isSet = !isSet;
            }));
  }
}
