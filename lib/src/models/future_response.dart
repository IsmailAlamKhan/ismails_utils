import 'package:freezed_annotation/freezed_annotation.dart';

part 'future_response.freezed.dart';

@freezed
class FutureResponse<T extends Object> with _$FutureResponse<T> {
  const factory FutureResponse.idle() = IdleFutureResponse<T>;

  const factory FutureResponse.success(T data) = SuccessFutureResponse<T>;

  const factory FutureResponse.loading() = LoadingFutureResponse<T>;

  const factory FutureResponse.empty() = EmptyFutureResponse<T>;

  const factory FutureResponse.error([
    Object? exception,
    StackTrace? stackTrace,
  ]) = ErrorFutureResponse<T>;

  const factory FutureResponse.loadingMore(T data) = LoadingMoreFutureResponse<T>;

  const factory FutureResponse.loadingMoreError(
    T data, [
    Object? exception,
    StackTrace? stackTrace,
  ]) = LoadingMoreErrorFutureResponse<T>;
}
