import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:graphx/graphx.dart';

import '../src.dart';

class DioClient {
  DioClient.init(
    this.host,
    this.port,
    this.baseOptions, {
    this.responseBody = true,
  }) {
    LoggerService.instance.logger.i(
      'DioClient started, Base Url is ${baseOptions.baseUrl}',
    );
    instance = this;
  }

  final bool responseBody;
  static late DioClient instance;
  final BaseOptions baseOptions;
  final String host;
  final int port;

  Dio get _dio => Dio(baseOptions)
    ..httpClientAdapter
    ..interceptors.add(
      LogInterceptor(
        logPrint: (object) async {
          if (kDebugMode) {
            debugPrint(object.toString());
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
    if (ConnectivityService.instance.connectivity == ConnectivityResult.none) {
      return ConnectivityCheck(
        canConnect: false,
        messege: "No internet connection",
      );
    }
    if (!kIsWeb) {
      try {
        final socket = await Socket.connect(
          host,
          port,
          timeout: Duration(seconds: 2),
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
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    dynamic data,
  }) async {
    final _connectivityCheck = await connectivityCheck;
    if (!_connectivityCheck.canConnect) {
      throw CustomException.error(_connectivityCheck.messege);
    }
    try {
      final res = await _dio.get(
        url,
        queryParameters: queryParams,
        options: options,
      );
      return res;
    } on DioError catch (e) {
      throw CustomException.fromDioError(e);
    } catch (e) {
      throw CustomException.error(e.toString());
    }
  }

  Future<Response> post(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    required dynamic data,
  }) async {
    final _connectivityCheck = await connectivityCheck;
    if (!_connectivityCheck.canConnect) {
      throw CustomException.error(_connectivityCheck.messege);
    }

    try {
      final res = await _dio.post(
        url,
        queryParameters: queryParams,
        data: data,
        options: options,
      );

      return res;
    } on DioError catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<Response> put(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    required dynamic data,
  }) async {
    final _connectivityCheck = await connectivityCheck;
    if (!_connectivityCheck.canConnect) {
      throw CustomException.error(_connectivityCheck.messege);
    }

    try {
      final res = await _dio.put(
        url,
        queryParameters: queryParams,
        data: data,
        options: options,
      );

      return res;
    } on DioError catch (e) {
      throw CustomException.fromDioError(e);
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
