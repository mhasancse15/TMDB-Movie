import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginatedState<T> {
  final List<T> items;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;
  final String? errorMessage;

  const PaginatedState({
    this.items = const [],
    this.page = 1,
    this.hasMore = true,
    this.isLoadingMore = false,
    this.errorMessage,
  });

  PaginatedState<T> copyWith({
    List<T>? items,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
    String? errorMessage,
  }) {
    return PaginatedState<T>(
      items: items ?? this.items,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

abstract class PaginatedNotifier<T> extends StateNotifier<AsyncValue<PaginatedState<T>>> {
  PaginatedNotifier() : super(const AsyncValue.loading());

  Future<List<T>> fetchPage(int page);

  Future<void> loadInitial() async {
    state = const AsyncValue.loading();
    try {
      final items = await fetchPage(1);
      state = AsyncValue.data(
        PaginatedState(
          items: items,
          page: 1,
          hasMore: items.isNotEmpty,
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || current.isLoadingMore || !current.hasMore) return;

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));
    try {
      final nextPage = current.page + 1;
      final newItems = await fetchPage(nextPage);
      state = AsyncValue.data(
        current.copyWith(
          items: [...current.items, ...newItems],
          page: nextPage,
          hasMore: newItems.isNotEmpty,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      state = AsyncValue.data(
        current.copyWith(
          isLoadingMore: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> refresh() async {
    await loadInitial();
  }

  Future<void> retry() async {
    if (state.hasError) {
      await loadInitial();
    } else {
      await loadMore();
    }
  }
}
