import 'package:flutter/material.dart';

import 'package:rick_and_morty/common/common.dart';

class EmptyPlaceholder extends SpacePlaceholder {
  const EmptyPlaceholder({
    required super.text,
    super.showError = false,
    super.key,
  });
}

class ErrorPlaceholder extends SpacePlaceholder {
  const ErrorPlaceholder({
    required super.text,
    super.showError = true,
    super.key,
  });
}

class SpacePlaceholder extends StatelessWidget {
  final String text;
  final bool showError;

  const SpacePlaceholder({
    required this.text,
    required this.showError,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = showError ? Theme.of(context).colorScheme.error : null;
    final lines = text.split('\n');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: FormLayout.largeSpacing,
        children: [
          Text(
            lines[0],
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: color),
          ),
          if (lines.length > 1)
            Text(
              lines[1],
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color),
            ),
        ],
      ),
    );
  }
}
