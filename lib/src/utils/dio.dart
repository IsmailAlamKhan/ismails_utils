import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../src.dart';

/// {@template DioClient}
/// This is the dioclient which returns a response or an
/// [IsmailException.fromDioError]
/// {@endtemplate}
class DioClient with Logger {
  @override
  String name = 'DioClient';

  /// {@macro DioClient}
  DioClient(
    this.baseOptions, {
    this.wantConnectivityCheck = true,
    this.host,
    this.port,
    this.responseBody = true,
  }) : assert(!wantConnectivityCheck || host != null || port != null,
            'DioClient- If you want connectivity check please provide host and port') {
    logger.info('DioClient started, Base Url is ${baseOptions.baseUrl}');
    instance = this;
  }

  /// If you want to check the connectivity to the server or not if this is
  /// true [DioClient.host] and [DioClient.port] musn not be null
  final bool wantConnectivityCheck;

  /// Wether you want to print the responsebody or not when dio logs
  final bool responseBody;

  /// Gives the instance of [DioClient]
  static late DioClient instance;

  /// The base options to provide when initializing
  final BaseOptions baseOptions;

  /// used to check the connectivity with the server that you are making
  /// http requests to
  final String? host;

  /// used to check the connectivity with the server that you are making
  /// http requests to
  final int? port;

  Dio get _dio => Dio(baseOptions)
    ..httpClientAdapter
    ..interceptors.add(
      LogInterceptor(
        logPrint: (object) async {
          if (kDebugMode) {
            logger.info(object.toString());
          }
        },
        requestHeader: false,
        responseHeader: false,
        responseBody: responseBody,
        requestBody: true,
      ),
    );

  /// Clear the current Dio instance waiting queue.
  void cancelAll() {
    _dio.clear();
  }

  /// Used to check the connectivity with the server
  Future<_ConnectivityCheck> get connectivityCheck async {
    if (!wantConnectivityCheck) {
      return _ConnectivityCheck(
        canConnect: true,
      );
    }
    if (!kIsWeb) {
      try {
        final socket = await Socket.connect(
          host,
          port!,
          timeout: const Duration(seconds: 2),
        );
        socket.destroy();
        return _ConnectivityCheck(
          canConnect: true,
        );
      } catch (e) {
        return _ConnectivityCheck(
          canConnect: false,
          messege: 'Server down',
        );
      }
    } else {
      return _ConnectivityCheck(
        canConnect: true,
      );
    }
  }

  /// Get request with a bit of modification
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final _connectivityCheck = await connectivityCheck;
    if (!_connectivityCheck.canConnect) {
      throw IsmailException.error(_connectivityCheck.messege);
    }
    try {
      final res = await _dio.get<T>(
        url,
        queryParameters: queryParams,
        options: options,
      );
      return res;
    } on DioError catch (e) {
      throw IsmailException.fromDioError(e);
    } catch (e) {
      throw IsmailException.error(e.toString());
    }
  }

  /// Get post with a bit of modification
  Future<Response<T>> post<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    required dynamic data,
  }) async {
    final _connectivityCheck = await connectivityCheck;
    if (!_connectivityCheck.canConnect) {
      throw IsmailException.error(_connectivityCheck.messege);
    }

    try {
      final res = await _dio.post<T>(
        url,
        queryParameters: queryParams,
        data: data,
        options: options,
      );

      return res;
    } on DioError catch (e) {
      throw IsmailException.fromDioError(e);
    }
  }

  /// Get put with a bit of modification
  Future<Response<T>> put<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    required dynamic data,
  }) async {
    final _connectivityCheck = await connectivityCheck;
    if (!_connectivityCheck.canConnect) {
      throw IsmailException.error(_connectivityCheck.messege);
    }

    try {
      final res = await _dio.put<T>(
        url,
        queryParameters: queryParams,
        data: data,
        options: options,
      );

      return res;
    } on DioError catch (e) {
      throw IsmailException.fromDioError(e);
    }
  }

  /// Get delete with a bit of modification
  Future<Response<T>> delete<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    required dynamic data,
  }) async {
    final _connectivityCheck = await connectivityCheck;
    if (!_connectivityCheck.canConnect) {
      throw IsmailException.error(_connectivityCheck.messege);
    }

    try {
      final res = await _dio.delete<T>(
        url,
        queryParameters: queryParams,
        data: data,
        options: options,
      );

      return res;
    } on DioError catch (e) {
      throw IsmailException.fromDioError(e);
    }
  }
}

class _ConnectivityCheck {
  bool canConnect;
  String messege;
  _ConnectivityCheck({
    required this.canConnect,
    this.messege = '',
  });
}
