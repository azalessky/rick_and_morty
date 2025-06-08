import 'package:flutter/material.dart';

import 'package:rick_and_morty/common/common.dart';

class SpacePlaceholder extends StatelessWidget {
  final String text;
  final bool compact;
  final bool showError;

  const SpacePlaceholder({
    required this.text,
    this.compact = false,
    this.showError = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = showError ? Theme.of(context).colorScheme.error : null;
    final lines = text.split('\n');

    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.titleMedium!.copyWith(color: color);
    final bodyStyle = textTheme.bodyMedium!.copyWith(color: color);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: compact ? FormLayout.extraSmallSpacing : FormLayout.largeSpacing,
        children: [
          Text(lines[0], style: compact ? bodyStyle : titleStyle),
          if (lines.length > 1) Text(lines[1], style: bodyStyle),
        ],
      ),
    );
  }
}
