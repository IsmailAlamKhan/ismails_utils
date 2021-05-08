import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../src.dart';

class DioClient {
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
  final bool wantConnectivityCheck;

  final bool responseBody;
  static late DioClient instance;
  final BaseOptions baseOptions;
  final String? host;
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
  void cancelAll() {
    _dio.clear();
  }

  Future<ConnectivityCheck> get connectivityCheck async {
    if (!wantConnectivityCheck) {
      return ConnectivityCheck(
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
        return ConnectivityCheck(
          canConnect: true,
        );
      } catch (e) {
        return ConnectivityCheck(
          canConnect: false,
          messege: 'Server down',
        );
      }
    } else {
      return ConnectivityCheck(
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

class ConnectivityCheck {
  bool canConnect;
  String messege;
  ConnectivityCheck({
    required this.canConnect,
    this.messege = '',
  });
}
