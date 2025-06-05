import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:rick_and_morty/widgets/widgets.dart';

@RoutePage()
class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CharactersScreen.Title'.tr()),
      ),
      body: CharacterListView(
        emptyText: 'CharactersScreen.EmptyText'.tr(),
        errorText: 'CharactersScreen.ErrorText'.tr(),
        errorItem: 'CharactersScreen.ErrorItem'.tr(),
      ),
    );
  }
}
