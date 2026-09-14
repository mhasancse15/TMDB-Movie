import '../../../../core/network/api_result.dart';
import '../models/tv_show.dart';
import '../models/tv_details.dart';
import '../../../movies/domain/models/media_cast.dart';

abstract class TVRepository {
  Future<ApiResult<List<TVShow>>> getTrendingTV({int page = 1});
  Future<ApiResult<List<TVShow>>> getPopularTV({int page = 1});
  Future<ApiResult<List<TVShow>>> getTopRatedTV({int page = 1});
  Future<ApiResult<List<TVShow>>> getAiringTodayTV({int page = 1});
  Future<ApiResult<TVDetails>> getTVDetails(int id);
  Future<ApiResult<List<MediaCast>>> getTVCast(int id);
}
