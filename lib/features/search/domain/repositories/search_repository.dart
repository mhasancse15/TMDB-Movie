import '../../../../core/network/api_result.dart';

abstract class SearchRepository {
  Future<ApiResult<List<dynamic>>> searchMulti(String query, {int page = 1});
  Future<List<String>> getSearchHistory();
  Future<void> addSearchQuery(String query);
  Future<void> clearSearchHistory();
}
