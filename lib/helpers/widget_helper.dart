import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get _textTheme => Theme.of(this).textTheme;

  Color get textColor {
    return _textTheme.bodyMedium!.color!;
  }

  Text textSmall(String text) {
    return Text(text, style: _textTheme.bodySmall);
  }

  Text textMedium(String text) {
    return Text(text, style: _textTheme.bodyMedium);
  }

  Text textLarge(String text) {
    return Text(text, style: _textTheme.bodyLarge);
  }

  Text titleSmall(String text) {
    return Text(text, style: _textTheme.titleSmall);
  }

  Text titleMedium(String text) {
    return Text(text, style: _textTheme.titleMedium);
  }

  Text titleLarge(String text) {
    return Text(text, style: _textTheme.titleLarge);
  }

  Text labelSmall(String text) {
    return Text(text, style: _textTheme.labelSmall);
  }

  Text labelLarge(String text) {
    return Text(text, style: _textTheme.labelLarge);
  }
}
