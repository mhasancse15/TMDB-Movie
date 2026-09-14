import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../../core/utils/debouncer.dart';

class SearchState {
  final String query;
  final String selectedFilter; // 'all', 'movie', 'tv', 'person'
  final List<dynamic> results;
  final List<String> history;
  final bool isLoading;
  final String? errorMessage;

  const SearchState({
    this.query = '',
    this.selectedFilter = 'all',
    this.results = const [],
    this.history = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  SearchState copyWith({
    String? query,
    String? selectedFilter,
    List<dynamic>? results,
    List<String>? history,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SearchState(
      query: query ?? this.query,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      results: results ?? this.results,
      history: history ?? this.history,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class SearchNotifier extends StateNotifier<SearchState> {
  final Ref _ref;
  final Debouncer _debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  SearchNotifier(this._ref) : super(const SearchState()) {
    loadHistory();
  }

  Future<void> loadHistory() async {
    final searchRepo = _ref.read(searchRepositoryProvider);
    final history = await searchRepo.getSearchHistory();
    state = state.copyWith(history: history);
  }

  void onQueryChanged(String query) {
    state = state.copyWith(query: query);
    if (query.trim().isEmpty) {
      state = state.copyWith(results: [], isLoading: false);
      _debouncer.cancel();
      return;
    }

    state = state.copyWith(isLoading: true);
    _debouncer.run(() => performSearch(query));
  }

  Future<void> performSearch(String query) async {
    final searchRepo = _ref.read(searchRepositoryProvider);
    final res = await searchRepo.searchMulti(query);
    res.when(
      success: (data) {
        state = state.copyWith(results: data, isLoading: false);
        loadHistory();
      },
      failure: (fail) {
        state = state.copyWith(errorMessage: fail.message, isLoading: false);
      },
    );
  }

  void setFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);
  }

  Future<void> clearHistory() async {
    final searchRepo = _ref.read(searchRepositoryProvider);
    await searchRepo.clearSearchHistory();
    state = state.copyWith(history: []);
  }

  @override
  void dispose() {
    _debouncer.cancel();
    super.dispose();
  }
}

final searchNotifierProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier(ref);
});
