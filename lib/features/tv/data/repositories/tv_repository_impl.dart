import '../../../../core/error/failures.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/tmdb_api_service.dart';
import '../../../movies/domain/models/media_cast.dart';
import '../../domain/models/tv_details.dart';
import '../../domain/models/tv_show.dart';
import '../../domain/repositories/tv_repository.dart';

class TVRepositoryImpl implements TVRepository {
  final TmdbApiService _apiService;

  TVRepositoryImpl({
    required TmdbApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<ApiResult<List<TVShow>>> getTrendingTV({int page = 1}) async {
    try {
      final shows = await _apiService.getTrendingTV(page: page);
      return ApiResult.success(shows);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<TVShow>>> getPopularTV({int page = 1}) async {
    try {
      final shows = await _apiService.getPopularTV(page: page);
      return ApiResult.success(shows);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<TVShow>>> getTopRatedTV({int page = 1}) async {
    try {
      final shows = await _apiService.getTopRatedTV(page: page);
      return ApiResult.success(shows);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<TVShow>>> getAiringTodayTV({int page = 1}) async {
    try {
      final shows = await _apiService.getAiringTodayTV(page: page);
      return ApiResult.success(shows);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<TVDetails>> getTVDetails(int id) async {
    try {
      final details = await _apiService.getTVDetails(id);
      return ApiResult.success(details);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<MediaCast>>> getTVCast(int id) async {
    try {
      final cast = await _apiService.getTVCast(id);
      return ApiResult.success(cast);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}
