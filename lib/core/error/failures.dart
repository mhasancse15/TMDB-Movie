import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.statusCode});
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No Internet Connection. Showing cached content.']);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Invalid TMDB API key. Please check your config.']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Requested movie or content was not found.']);
}

class RateLimitFailure extends Failure {
  const RateLimitFailure([super.message = 'Too many requests. Please slow down.']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred.']);
}
