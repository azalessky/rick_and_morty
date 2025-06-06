import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/providers/providers.dart';
import 'package:rick_and_morty/widgets/widgets.dart';

class CharacterListView extends ConsumerStatefulWidget {
  final String errorText;
  final String errorItem;

  const CharacterListView({
    required this.errorText,
    required this.errorItem,
    super.key,
  });

  @override
  ConsumerState<CharacterListView> createState() => _CharactersListViewState();
}

class _CharactersListViewState extends ConsumerState<CharacterListView> {
  var scrollController = ScrollController();
  bool hasMore = true;
  bool isLoadingMore = false;
  bool isRefreshing = false;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(charactersStateProvider);

    return RefreshIndicator(
      onRefresh: () {
        isRefreshing = true;
        return ref.refresh(charactersStateProvider.future);
      },
      child: posts.when(
        skipLoadingOnRefresh: isRefreshing,
        data: (data) {
          isRefreshing = false;
          if (data.items.isNotEmpty) {
            return _buildListView(data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        error: (_, _) {
          isRefreshing = false;
          return _buildErrorPlaceholder();
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildListView(CharacterList characters) {
    return NotificationListener<OverscrollNotification>(
      child: ListView.builder(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        itemCount: characters.items.length + (characters.hasMore ? 1 : 0),
        itemBuilder: (_, index) {
          if (index < characters.items.length) {
            final character = characters.items[index];
            return CharacterListItem(
              key: ValueKey(character.id),
              character: character,
            );
          } else {
            return LoadMoreIndicator();
          }
        },
      ),
      onNotification: (notification) {
        if (notification.overscroll > 0) _loadMoreItems();
        return false;
      },
    );
  }

  Widget _buildErrorPlaceholder() {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: ErrorPlaceholder(text: widget.errorText),
        ),
      ],
    );
  }

  void _loadMoreItems() async {
    if (hasMore && !isLoadingMore) {
      isLoadingMore = true;

      await ref.read(charactersStateProvider.notifier).loadNext();
      final posts = ref.read(charactersStateProvider);

      hasMore = posts.value?.hasMore ?? false;
      isLoadingMore = false;
    }
  }
}
