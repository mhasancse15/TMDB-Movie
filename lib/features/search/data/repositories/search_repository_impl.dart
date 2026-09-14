import '../../../../core/error/failures.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/tmdb_api_service.dart';
import '../../../../core/storage/app_database.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final TmdbApiService _apiService;
  final AppDatabase _database;

  SearchRepositoryImpl({
    required TmdbApiService apiService,
    required AppDatabase database,
  })  : _apiService = apiService,
        _database = database;

  @override
  Future<ApiResult<List<dynamic>>> searchMulti(String query, {int page = 1}) async {
    if (query.trim().isEmpty) return ApiResult.success([]);
    try {
      final results = await _apiService.searchMulti(query, page: page);
      await _database.addSearchQuery(query);
      return ApiResult.success(results);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<List<String>> getSearchHistory() => _database.getRecentSearches();

  @override
  Future<void> addSearchQuery(String query) => _database.addSearchQuery(query);

  @override
  Future<void> clearSearchHistory() => _database.clearSearchHistory();
}
