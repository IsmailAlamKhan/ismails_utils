import 'package:dio/dio.dart';
import 'package:graphx/graphx.dart';

import '../../some_basic_utils.dart';

class DioClient {
  static DioClient get instance => DioClient();
  Dio get _dio => Dio()
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
        request: false,
        responseBody: true,
        requestBody: true,
      ),
    );

  /// Get request with a bit of modification
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final res = await _dio.get(url);

      return res;
    } on DioError catch (e) {
      throw CustomDioException.fromDioError(e);
    } catch (e) {
      throw CustomDioException.error(e);
    }
  }

  Future<Response> postDeleteUpdate(
    String url,
    RequestType requestType, {
    Map<String, dynamic>? queryParams,
    Options? options,
    required dynamic data,
  }) async {
    try {
      late Response res;
      switch (requestType) {
        case RequestType.post:
          res = await _dio.post(
            url,
            queryParameters: queryParams,
            data: data,
            options: options,
          );
          break;
        case RequestType.put:
          res = await _dio.put(
            url,
            queryParameters: queryParams,
            data: data,
            options: options,
          );
          break;
        case RequestType.delete:
          res = await _dio.delete(
            url,
            queryParameters: queryParams,
            data: data,
            options: options,
          );
          break;
        default:
      }

      return res;
    } on DioError catch (e) {
      throw CustomDioException.fromDioError(e);
    }
  }
}
