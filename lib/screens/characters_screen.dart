import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_and_morty/providers/providers.dart';
import 'package:rick_and_morty/widgets/widgets.dart';

@RoutePage()
class CharactersScreen extends ConsumerStatefulWidget {
  const CharactersScreen({super.key});

  @override
  ConsumerState<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends ConsumerState<CharactersScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await ref.read(charactersStateProvider.future);
      await ref.read(charactersStateProvider.notifier).loadNext();
    });
  }

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
