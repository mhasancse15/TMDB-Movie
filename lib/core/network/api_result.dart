import '../error/failures.dart';

sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) = Success<T>;
  factory ApiResult.failure(Failure failure) = FailureResult<T>;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  T? get dataOrNull => isSuccess ? (this as Success<T>).data : null;
  Failure? get failureOrNull => isFailure ? (this as FailureResult<T>).failure : null;

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else {
      return failure((this as FailureResult<T>).failure);
    }
  }
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class FailureResult<T> extends ApiResult<T> {
  final Failure failure;
  const FailureResult(this.failure);
}
