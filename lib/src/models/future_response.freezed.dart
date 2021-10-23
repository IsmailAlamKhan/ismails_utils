// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'future_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FutureResponseTearOff {
  const _$FutureResponseTearOff();

  IdleFutureResponse<T> idle<T extends Object>() {
    return IdleFutureResponse<T>();
  }

  SuccessFutureResponse<T> success<T extends Object>(T data) {
    return SuccessFutureResponse<T>(
      data,
    );
  }

  LoadingFutureResponse<T> loading<T extends Object>() {
    return LoadingFutureResponse<T>();
  }

  EmptyFutureResponse<T> empty<T extends Object>() {
    return EmptyFutureResponse<T>();
  }

  ErrorFutureResponse<T> error<T extends Object>(
      [Object? exception, StackTrace? stackTrace]) {
    return ErrorFutureResponse<T>(
      exception,
      stackTrace,
    );
  }

  LoadingMoreFutureResponse<T> loadingMore<T extends Object>(T data) {
    return LoadingMoreFutureResponse<T>(
      data,
    );
  }

  LoadingMoreErrorFutureResponse<T> loadingMoreError<T extends Object>(T data,
      [Object? exception, StackTrace? stackTrace]) {
    return LoadingMoreErrorFutureResponse<T>(
      data,
      exception,
      stackTrace,
    );
  }
}

/// @nodoc
const $FutureResponse = _$FutureResponseTearOff();

/// @nodoc
mixin _$FutureResponse<T extends Object> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object? exception, StackTrace? stackTrace) error,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data, Object? exception, StackTrace? stackTrace)
        loadingMoreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleFutureResponse<T> value) idle,
    required TResult Function(SuccessFutureResponse<T> value) success,
    required TResult Function(LoadingFutureResponse<T> value) loading,
    required TResult Function(EmptyFutureResponse<T> value) empty,
    required TResult Function(ErrorFutureResponse<T> value) error,
    required TResult Function(LoadingMoreFutureResponse<T> value) loadingMore,
    required TResult Function(LoadingMoreErrorFutureResponse<T> value)
        loadingMoreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FutureResponseCopyWith<T extends Object, $Res> {
  factory $FutureResponseCopyWith(
          FutureResponse<T> value, $Res Function(FutureResponse<T>) then) =
      _$FutureResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$FutureResponseCopyWithImpl<T extends Object, $Res>
    implements $FutureResponseCopyWith<T, $Res> {
  _$FutureResponseCopyWithImpl(this._value, this._then);

  final FutureResponse<T> _value;
  // ignore: unused_field
  final $Res Function(FutureResponse<T>) _then;
}

/// @nodoc
abstract class $IdleFutureResponseCopyWith<T extends Object, $Res> {
  factory $IdleFutureResponseCopyWith(IdleFutureResponse<T> value,
          $Res Function(IdleFutureResponse<T>) then) =
      _$IdleFutureResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$IdleFutureResponseCopyWithImpl<T extends Object, $Res>
    extends _$FutureResponseCopyWithImpl<T, $Res>
    implements $IdleFutureResponseCopyWith<T, $Res> {
  _$IdleFutureResponseCopyWithImpl(
      IdleFutureResponse<T> _value, $Res Function(IdleFutureResponse<T>) _then)
      : super(_value, (v) => _then(v as IdleFutureResponse<T>));

  @override
  IdleFutureResponse<T> get _value => super._value as IdleFutureResponse<T>;
}

/// @nodoc

class _$IdleFutureResponse<T extends Object> implements IdleFutureResponse<T> {
  const _$IdleFutureResponse();

  @override
  String toString() {
    return 'FutureResponse<$T>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IdleFutureResponse<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object? exception, StackTrace? stackTrace) error,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data, Object? exception, StackTrace? stackTrace)
        loadingMoreError,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleFutureResponse<T> value) idle,
    required TResult Function(SuccessFutureResponse<T> value) success,
    required TResult Function(LoadingFutureResponse<T> value) loading,
    required TResult Function(EmptyFutureResponse<T> value) empty,
    required TResult Function(ErrorFutureResponse<T> value) error,
    required TResult Function(LoadingMoreFutureResponse<T> value) loadingMore,
    required TResult Function(LoadingMoreErrorFutureResponse<T> value)
        loadingMoreError,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class IdleFutureResponse<T extends Object>
    implements FutureResponse<T> {
  const factory IdleFutureResponse() = _$IdleFutureResponse<T>;
}

/// @nodoc
abstract class $SuccessFutureResponseCopyWith<T extends Object, $Res> {
  factory $SuccessFutureResponseCopyWith(SuccessFutureResponse<T> value,
          $Res Function(SuccessFutureResponse<T>) then) =
      _$SuccessFutureResponseCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$SuccessFutureResponseCopyWithImpl<T extends Object, $Res>
    extends _$FutureResponseCopyWithImpl<T, $Res>
    implements $SuccessFutureResponseCopyWith<T, $Res> {
  _$SuccessFutureResponseCopyWithImpl(SuccessFutureResponse<T> _value,
      $Res Function(SuccessFutureResponse<T>) _then)
      : super(_value, (v) => _then(v as SuccessFutureResponse<T>));

  @override
  SuccessFutureResponse<T> get _value =>
      super._value as SuccessFutureResponse<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(SuccessFutureResponse<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessFutureResponse<T extends Object>
    implements SuccessFutureResponse<T> {
  const _$SuccessFutureResponse(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'FutureResponse<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessFutureResponse<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $SuccessFutureResponseCopyWith<T, SuccessFutureResponse<T>> get copyWith =>
      _$SuccessFutureResponseCopyWithImpl<T, SuccessFutureResponse<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object? exception, StackTrace? stackTrace) error,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data, Object? exception, StackTrace? stackTrace)
        loadingMoreError,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleFutureResponse<T> value) idle,
    required TResult Function(SuccessFutureResponse<T> value) success,
    required TResult Function(LoadingFutureResponse<T> value) loading,
    required TResult Function(EmptyFutureResponse<T> value) empty,
    required TResult Function(ErrorFutureResponse<T> value) error,
    required TResult Function(LoadingMoreFutureResponse<T> value) loadingMore,
    required TResult Function(LoadingMoreErrorFutureResponse<T> value)
        loadingMoreError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessFutureResponse<T extends Object>
    implements FutureResponse<T> {
  const factory SuccessFutureResponse(T data) = _$SuccessFutureResponse<T>;

  T get data;
  @JsonKey(ignore: true)
  $SuccessFutureResponseCopyWith<T, SuccessFutureResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingFutureResponseCopyWith<T extends Object, $Res> {
  factory $LoadingFutureResponseCopyWith(LoadingFutureResponse<T> value,
          $Res Function(LoadingFutureResponse<T>) then) =
      _$LoadingFutureResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$LoadingFutureResponseCopyWithImpl<T extends Object, $Res>
    extends _$FutureResponseCopyWithImpl<T, $Res>
    implements $LoadingFutureResponseCopyWith<T, $Res> {
  _$LoadingFutureResponseCopyWithImpl(LoadingFutureResponse<T> _value,
      $Res Function(LoadingFutureResponse<T>) _then)
      : super(_value, (v) => _then(v as LoadingFutureResponse<T>));

  @override
  LoadingFutureResponse<T> get _value =>
      super._value as LoadingFutureResponse<T>;
}

/// @nodoc

class _$LoadingFutureResponse<T extends Object>
    implements LoadingFutureResponse<T> {
  const _$LoadingFutureResponse();

  @override
  String toString() {
    return 'FutureResponse<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingFutureResponse<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object? exception, StackTrace? stackTrace) error,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data, Object? exception, StackTrace? stackTrace)
        loadingMoreError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleFutureResponse<T> value) idle,
    required TResult Function(SuccessFutureResponse<T> value) success,
    required TResult Function(LoadingFutureResponse<T> value) loading,
    required TResult Function(EmptyFutureResponse<T> value) empty,
    required TResult Function(ErrorFutureResponse<T> value) error,
    required TResult Function(LoadingMoreFutureResponse<T> value) loadingMore,
    required TResult Function(LoadingMoreErrorFutureResponse<T> value)
        loadingMoreError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingFutureResponse<T extends Object>
    implements FutureResponse<T> {
  const factory LoadingFutureResponse() = _$LoadingFutureResponse<T>;
}

/// @nodoc
abstract class $EmptyFutureResponseCopyWith<T extends Object, $Res> {
  factory $EmptyFutureResponseCopyWith(EmptyFutureResponse<T> value,
          $Res Function(EmptyFutureResponse<T>) then) =
      _$EmptyFutureResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$EmptyFutureResponseCopyWithImpl<T extends Object, $Res>
    extends _$FutureResponseCopyWithImpl<T, $Res>
    implements $EmptyFutureResponseCopyWith<T, $Res> {
  _$EmptyFutureResponseCopyWithImpl(EmptyFutureResponse<T> _value,
      $Res Function(EmptyFutureResponse<T>) _then)
      : super(_value, (v) => _then(v as EmptyFutureResponse<T>));

  @override
  EmptyFutureResponse<T> get _value => super._value as EmptyFutureResponse<T>;
}

/// @nodoc

class _$EmptyFutureResponse<T extends Object>
    implements EmptyFutureResponse<T> {
  const _$EmptyFutureResponse();

  @override
  String toString() {
    return 'FutureResponse<$T>.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyFutureResponse<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object? exception, StackTrace? stackTrace) error,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data, Object? exception, StackTrace? stackTrace)
        loadingMoreError,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleFutureResponse<T> value) idle,
    required TResult Function(SuccessFutureResponse<T> value) success,
    required TResult Function(LoadingFutureResponse<T> value) loading,
    required TResult Function(EmptyFutureResponse<T> value) empty,
    required TResult Function(ErrorFutureResponse<T> value) error,
    required TResult Function(LoadingMoreFutureResponse<T> value) loadingMore,
    required TResult Function(LoadingMoreErrorFutureResponse<T> value)
        loadingMoreError,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyFutureResponse<T extends Object>
    implements FutureResponse<T> {
  const factory EmptyFutureResponse() = _$EmptyFutureResponse<T>;
}

/// @nodoc
abstract class $ErrorFutureResponseCopyWith<T extends Object, $Res> {
  factory $ErrorFutureResponseCopyWith(ErrorFutureResponse<T> value,
          $Res Function(ErrorFutureResponse<T>) then) =
      _$ErrorFutureResponseCopyWithImpl<T, $Res>;
  $Res call({Object? exception, StackTrace? stackTrace});
}

/// @nodoc
class _$ErrorFutureResponseCopyWithImpl<T extends Object, $Res>
    extends _$FutureResponseCopyWithImpl<T, $Res>
    implements $ErrorFutureResponseCopyWith<T, $Res> {
  _$ErrorFutureResponseCopyWithImpl(ErrorFutureResponse<T> _value,
      $Res Function(ErrorFutureResponse<T>) _then)
      : super(_value, (v) => _then(v as ErrorFutureResponse<T>));

  @override
  ErrorFutureResponse<T> get _value => super._value as ErrorFutureResponse<T>;

  @override
  $Res call({
    Object? exception = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(ErrorFutureResponse<T>(
      exception == freezed ? _value.exception : exception,
      stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ErrorFutureResponse<T extends Object>
    implements ErrorFutureResponse<T> {
  const _$ErrorFutureResponse([this.exception, this.stackTrace]);

  @override
  final Object? exception;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'FutureResponse<$T>.error(exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorFutureResponse<T> &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exception), stackTrace);

  @JsonKey(ignore: true)
  @override
  $ErrorFutureResponseCopyWith<T, ErrorFutureResponse<T>> get copyWith =>
      _$ErrorFutureResponseCopyWithImpl<T, ErrorFutureResponse<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object? exception, StackTrace? stackTrace) error,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data, Object? exception, StackTrace? stackTrace)
        loadingMoreError,
  }) {
    return error(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
  }) {
    return error?.call(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleFutureResponse<T> value) idle,
    required TResult Function(SuccessFutureResponse<T> value) success,
    required TResult Function(LoadingFutureResponse<T> value) loading,
    required TResult Function(EmptyFutureResponse<T> value) empty,
    required TResult Function(ErrorFutureResponse<T> value) error,
    required TResult Function(LoadingMoreFutureResponse<T> value) loadingMore,
    required TResult Function(LoadingMoreErrorFutureResponse<T> value)
        loadingMoreError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorFutureResponse<T extends Object>
    implements FutureResponse<T> {
  const factory ErrorFutureResponse(
      [Object? exception, StackTrace? stackTrace]) = _$ErrorFutureResponse<T>;

  Object? get exception;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  $ErrorFutureResponseCopyWith<T, ErrorFutureResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingMoreFutureResponseCopyWith<T extends Object, $Res> {
  factory $LoadingMoreFutureResponseCopyWith(LoadingMoreFutureResponse<T> value,
          $Res Function(LoadingMoreFutureResponse<T>) then) =
      _$LoadingMoreFutureResponseCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$LoadingMoreFutureResponseCopyWithImpl<T extends Object, $Res>
    extends _$FutureResponseCopyWithImpl<T, $Res>
    implements $LoadingMoreFutureResponseCopyWith<T, $Res> {
  _$LoadingMoreFutureResponseCopyWithImpl(LoadingMoreFutureResponse<T> _value,
      $Res Function(LoadingMoreFutureResponse<T>) _then)
      : super(_value, (v) => _then(v as LoadingMoreFutureResponse<T>));

  @override
  LoadingMoreFutureResponse<T> get _value =>
      super._value as LoadingMoreFutureResponse<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(LoadingMoreFutureResponse<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LoadingMoreFutureResponse<T extends Object>
    implements LoadingMoreFutureResponse<T> {
  const _$LoadingMoreFutureResponse(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'FutureResponse<$T>.loadingMore(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingMoreFutureResponse<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $LoadingMoreFutureResponseCopyWith<T, LoadingMoreFutureResponse<T>>
      get copyWith => _$LoadingMoreFutureResponseCopyWithImpl<T,
          LoadingMoreFutureResponse<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object? exception, StackTrace? stackTrace) error,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data, Object? exception, StackTrace? stackTrace)
        loadingMoreError,
  }) {
    return loadingMore(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
  }) {
    return loadingMore?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleFutureResponse<T> value) idle,
    required TResult Function(SuccessFutureResponse<T> value) success,
    required TResult Function(LoadingFutureResponse<T> value) loading,
    required TResult Function(EmptyFutureResponse<T> value) empty,
    required TResult Function(ErrorFutureResponse<T> value) error,
    required TResult Function(LoadingMoreFutureResponse<T> value) loadingMore,
    required TResult Function(LoadingMoreErrorFutureResponse<T> value)
        loadingMoreError,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class LoadingMoreFutureResponse<T extends Object>
    implements FutureResponse<T> {
  const factory LoadingMoreFutureResponse(T data) =
      _$LoadingMoreFutureResponse<T>;

  T get data;
  @JsonKey(ignore: true)
  $LoadingMoreFutureResponseCopyWith<T, LoadingMoreFutureResponse<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingMoreErrorFutureResponseCopyWith<T extends Object, $Res> {
  factory $LoadingMoreErrorFutureResponseCopyWith(
          LoadingMoreErrorFutureResponse<T> value,
          $Res Function(LoadingMoreErrorFutureResponse<T>) then) =
      _$LoadingMoreErrorFutureResponseCopyWithImpl<T, $Res>;
  $Res call({T data, Object? exception, StackTrace? stackTrace});
}

/// @nodoc
class _$LoadingMoreErrorFutureResponseCopyWithImpl<T extends Object, $Res>
    extends _$FutureResponseCopyWithImpl<T, $Res>
    implements $LoadingMoreErrorFutureResponseCopyWith<T, $Res> {
  _$LoadingMoreErrorFutureResponseCopyWithImpl(
      LoadingMoreErrorFutureResponse<T> _value,
      $Res Function(LoadingMoreErrorFutureResponse<T>) _then)
      : super(_value, (v) => _then(v as LoadingMoreErrorFutureResponse<T>));

  @override
  LoadingMoreErrorFutureResponse<T> get _value =>
      super._value as LoadingMoreErrorFutureResponse<T>;

  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(LoadingMoreErrorFutureResponse<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      exception == freezed ? _value.exception : exception,
      stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$LoadingMoreErrorFutureResponse<T extends Object>
    implements LoadingMoreErrorFutureResponse<T> {
  const _$LoadingMoreErrorFutureResponse(this.data,
      [this.exception, this.stackTrace]);

  @override
  final T data;
  @override
  final Object? exception;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'FutureResponse<$T>.loadingMoreError(data: $data, exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingMoreErrorFutureResponse<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(exception),
      stackTrace);

  @JsonKey(ignore: true)
  @override
  $LoadingMoreErrorFutureResponseCopyWith<T, LoadingMoreErrorFutureResponse<T>>
      get copyWith => _$LoadingMoreErrorFutureResponseCopyWithImpl<T,
          LoadingMoreErrorFutureResponse<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Object? exception, StackTrace? stackTrace) error,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data, Object? exception, StackTrace? stackTrace)
        loadingMoreError,
  }) {
    return loadingMoreError(data, exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
  }) {
    return loadingMoreError?.call(data, exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Object? exception, StackTrace? stackTrace)? error,
    TResult Function(T data)? loadingMore,
    TResult Function(T data, Object? exception, StackTrace? stackTrace)?
        loadingMoreError,
    required TResult orElse(),
  }) {
    if (loadingMoreError != null) {
      return loadingMoreError(data, exception, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleFutureResponse<T> value) idle,
    required TResult Function(SuccessFutureResponse<T> value) success,
    required TResult Function(LoadingFutureResponse<T> value) loading,
    required TResult Function(EmptyFutureResponse<T> value) empty,
    required TResult Function(ErrorFutureResponse<T> value) error,
    required TResult Function(LoadingMoreFutureResponse<T> value) loadingMore,
    required TResult Function(LoadingMoreErrorFutureResponse<T> value)
        loadingMoreError,
  }) {
    return loadingMoreError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
  }) {
    return loadingMoreError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleFutureResponse<T> value)? idle,
    TResult Function(SuccessFutureResponse<T> value)? success,
    TResult Function(LoadingFutureResponse<T> value)? loading,
    TResult Function(EmptyFutureResponse<T> value)? empty,
    TResult Function(ErrorFutureResponse<T> value)? error,
    TResult Function(LoadingMoreFutureResponse<T> value)? loadingMore,
    TResult Function(LoadingMoreErrorFutureResponse<T> value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (loadingMoreError != null) {
      return loadingMoreError(this);
    }
    return orElse();
  }
}

abstract class LoadingMoreErrorFutureResponse<T extends Object>
    implements FutureResponse<T> {
  const factory LoadingMoreErrorFutureResponse(T data,
      [Object? exception,
      StackTrace? stackTrace]) = _$LoadingMoreErrorFutureResponse<T>;

  T get data;
  Object? get exception;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  $LoadingMoreErrorFutureResponseCopyWith<T, LoadingMoreErrorFutureResponse<T>>
      get copyWith => throw _privateConstructorUsedError;
}
