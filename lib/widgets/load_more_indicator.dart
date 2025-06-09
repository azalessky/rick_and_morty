import 'package:flutter/material.dart';

class LoadMoreIndicator extends StatelessWidget {
  static const spinnerSize = 24.0;
  static const strokeWidth = 3.0;

  final double height;

  const LoadMoreIndicator({
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final padding = (height - spinnerSize) / 5;

    return Padding(
      padding: EdgeInsets.only(top: padding * 2, bottom: padding * 3),
      child: Center(
        child: SizedBox.square(
          dimension: spinnerSize,
          child: CircularProgressIndicator(strokeWidth: strokeWidth),
        ),
      ),
    );
  }
}
