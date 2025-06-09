import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_and_morty/common/common.dart';
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
  bool _hasMore = true;
  bool _isLoadingMore = false;
  bool _isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(charactersStateProvider);

    return RefreshIndicator(
      onRefresh: () {
        _isRefreshing = true;
        return ref.refresh(charactersStateProvider.future);
      },
      child: posts.when(
        skipLoadingOnRefresh: _isRefreshing,
        data: (data) {
          _isRefreshing = false;
          if (data.items.isNotEmpty) {
            return _buildListView(data, LoadMoreIndicator());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        error: (error, _) {
          _isRefreshing = false;
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
            final isFavorite = ref.read(favoritesStateProvider.notifier).isFavorite(character);

            ref.watch(
              favoritesStateProvider.select(
                (favorites) => favorites.items.any((c) => c.id == character.id),
              ),
            );
            return CharacterListItem(
              key: ValueKey(character.id),
              character: character,
              isFavorite: isFavorite,
              onToggleFavorite: (value) => _handleToggleFavorite(character),
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
    if (_hasMore && !_isLoadingMore) {
      _isLoadingMore = true;

      await ref.read(charactersStateProvider.notifier).loadNext();
      final posts = ref.read(charactersStateProvider);

      _hasMore = posts.value?.hasMore ?? false;
      _isLoadingMore = false;
    }
  }

  void _handleToggleFavorite(Character character) async {
    final favorite = await ref.read(favoritesStateProvider.notifier).toggleFavorite(character);
    messages.showMessage(
      favorite ? UserMessage.favoriteAdded : UserMessage.favoriteRemoved,
      [character.name],
    );
  }
}
