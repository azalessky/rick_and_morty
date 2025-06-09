import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

enum UserMessage {
  favoriteAdded,
  favoriteRemoved,
}

class Messages {
  final duration = Duration(milliseconds: 2000);
  final globalKey = GlobalKey<ScaffoldMessengerState>();

  void showMessage(UserMessage message, [List<String>? args]) {
    final text = switch (message) {
      UserMessage.favoriteAdded => 'Message.FavoriteAdded'.tr(args: args),
      UserMessage.favoriteRemoved => 'Message.FavoriteRemoved'.tr(args: args),
    };

    globalKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.zero,
        duration: duration,
      ),
    );
  }
}
