import '../../../../core/error/failures.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/tmdb_api_service.dart';
import '../../domain/models/person.dart';
import '../../domain/repositories/people_repository.dart';

class PeopleRepositoryImpl implements PeopleRepository {
  final TmdbApiService _apiService;

  PeopleRepositoryImpl({required TmdbApiService apiService}) : _apiService = apiService;

  @override
  Future<ApiResult<List<Person>>> getPopularPeople({int page = 1}) async {
    try {
      final people = await _apiService.getPopularPeople(page: page);
      return ApiResult.success(people);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<PersonDetails>> getPersonDetails(int id) async {
    try {
      final details = await _apiService.getPersonDetails(id);
      return ApiResult.success(details);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}
