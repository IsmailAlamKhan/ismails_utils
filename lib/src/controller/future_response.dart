import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../models/models.dart';

/// This class is used to handle futures easily use with what ever you want
mixin FutureResponseMixin<T extends Object> {
  /// If you want to auto fetch the data on init
  bool get autoFetchOnInit => false;

  /// Must implement this class to update the state
  @protected
  void setState(FutureResponse<T> state);

  /// Custom error handler by default this will throw the error to the state
  void errorHandler(Object e, StackTrace s) {
    setState(ErrorFutureResponse(e, s));
  }

  Future<T?> future();

  /// This is where you call the future and handle the response
  /// [future] is the future you want to call
  /// the [showLoadingState] is used to not revert the state to loading in case
  /// you are gonna use a RefreshIndicator its true by default
  Future<void> fetch([bool showLoadingState = true]) async {
    if (showLoadingState) setState(const LoadingFutureResponse());
    try {
      final res = await future();
      if (res == null) {
        setState(const EmptyFutureResponse());
      } else if (res is List && res.isEmpty) {
        setState(const EmptyFutureResponse());
      } else {
        setState(SuccessFutureResponse(res));
      }
    } catch (e, s) {
      errorHandler(e, s);
    }
  }

  /// This is used to retry the fetch
  /// the [showLoadingState] is used to not revert the state to loading in case
  /// you are gonna use a RefreshIndicator its true by default
  Future<void> reFetch([bool showLoadingState = true]) => fetch(showLoadingState);

  /// An init function which calls the fetch if [autoFetch] is true also
  /// your custom logic don't forget to call this in the class constructor
  void init() {
    if (autoFetchOnInit) {
      fetch();
    }
  }
}
