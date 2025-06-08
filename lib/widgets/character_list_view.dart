import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/providers/providers.dart';
import 'package:rick_and_morty/widgets/widgets.dart';

class CharacterListView extends ConsumerStatefulWidget {
  final String Function(Object) errorTextBuilder;

  const CharacterListView({
    required this.errorTextBuilder,
    super.key,
  });

  @override
  ConsumerState<CharacterListView> createState() => _CharactersListViewState();
}

class _CharactersListViewState extends ConsumerState<CharacterListView> {
  bool hasMore = true;
  bool isLoadingMore = false;
  bool isRefreshing = false;

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
            return _buildListView(data, LoadMoreIndicator());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        error: (error, _) {
          isRefreshing = false;
          if (posts.hasValue && posts.requireValue.items.isNotEmpty) {
            return _buildListView(posts.requireValue, _buildErrorListItem(error));
          } else {
            return _buildErrorPlaceholder(error);
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildListView(CharacterList characters, Widget moreIndicator) {
    return NotificationListener<OverscrollNotification>(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: characters.items.length + (characters.hasMore ? 1 : 0),
        itemBuilder: (_, index) {
          if (index < characters.items.length) {
            final character = characters.items[index];
            ref.watch(
              favoritesStateProvider.select(
                (favorites) => favorites.items.any((c) => c.id == character.id),
              ),
            );
            return CharacterListItem(
              key: ValueKey(character.id),
              character: character,
            );
          } else {
            return moreIndicator;
          }
        },
      ),
      onNotification: (notification) {
        if (notification.overscroll > 0) _loadMoreItems();
        return false;
      },
    );
  }

  Widget _buildErrorListItem(Object error) {
    return SizedBox(
      height: 60,
      child: Center(
        child: SpacePlaceholder(
          text: widget.errorTextBuilder(error),
          compact: true,
          showError: true,
        ),
      ),
    );
  }

  Widget _buildErrorPlaceholder(Object error) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: SpacePlaceholder(
            text: widget.errorTextBuilder(error),
            showError: true,
          ),
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
