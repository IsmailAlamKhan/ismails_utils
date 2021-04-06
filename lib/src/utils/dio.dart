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

  /// Get request with a bit of modification
  Future<Response> post(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    required dynamic data,
  }) async {
    try {
      final res = await _dio.post(
        url,
        queryParameters: queryParams,
        data: data,
        options: options,
      );

      return res;
    } on DioError catch (e) {
      throw CustomDioException.fromDioError(e);
    }
  }
}
