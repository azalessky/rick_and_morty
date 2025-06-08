import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  static const iconSize = 14.0;
  static const frameSize = 2.0;
  static const alphaValue = 240;
  static const selectedFillColor = Colors.yellow;
  static const selectedFrameColor = Colors.black;

  final bool isSelected;
  final void Function()? onPressed;

  const FavoriteIcon({
    required this.isSelected,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = isSelected ? selectedFillColor : colorScheme.surface;
    final frameColor = isSelected ? selectedFrameColor : colorScheme.surface;

    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.star,
            size: iconSize + frameSize * 2,
            color: frameColor.withAlpha(alphaValue),
          ),
          Icon(
            Icons.star,
            size: iconSize,
            color: iconColor.withAlpha(alphaValue),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
