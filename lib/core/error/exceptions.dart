class ServerException implements Exception {
  final String message;
  final int? statusCode;
  const ServerException({required this.message, this.statusCode});

  @override
  String toString() => 'ServerException(statusCode: $statusCode, message: $message)';
}

class CacheException implements Exception {
  final String message;
  const CacheException({required this.message});

  @override
  String toString() => 'CacheException(message: $message)';
}

class NetworkException implements Exception {
  final String message;
  const NetworkException({this.message = 'No Internet Connection'});

  @override
  String toString() => 'NetworkException(message: $message)';
}

class UnauthorizedException implements Exception {
  final String message;
  const UnauthorizedException({this.message = 'Unauthorized API key or session'});
}

class NotFoundException implements Exception {
  final String message;
  const NotFoundException({this.message = 'Resource not found'});
}

class RateLimitException implements Exception {
  final String message;
  const RateLimitException({this.message = 'Rate limit exceeded. Please try again later.'});
}
