import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../error/exceptions.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['api_key'] = ApiConstants.apiKey;
    options.queryParameters['include_adult'] = false;
    super.onRequest(options, handler);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        throw const NetworkException(message: 'Network connection timeout. Check your network.');

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        final statusMessage = err.response?.statusMessage ?? 'Server Error';

        if (statusCode == 401) {
          throw UnauthorizedException(message: statusMessage);
        } else if (statusCode == 404) {
          throw NotFoundException(message: statusMessage);
        } else if (statusCode == 429) {
          throw RateLimitException(message: statusMessage);
        } else if (statusCode != null && statusCode >= 500) {
          throw ServerException(message: 'TMDB Server Error ($statusCode)', statusCode: statusCode);
        } else {
          throw ServerException(message: statusMessage, statusCode: statusCode);
        }

      case DioExceptionType.cancel:
        break;

      default:
        throw ServerException(message: err.message ?? 'Unknown Dio Network Error');
    }

    super.onError(err, handler);
  }
}
