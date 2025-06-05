import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FavoritesScreen.Title'.tr()),
      ),
      body: Center(
        child: Text('Favorites Screen'),
      ),
    );
  }
}
