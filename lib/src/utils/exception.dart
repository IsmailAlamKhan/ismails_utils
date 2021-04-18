import 'package:dio/dio.dart';

import 'logger.dart';

class CustomException implements Exception {
  CustomException.error(dynamic e) {
    message = e.toString();
    LoggerService.instance.logger.e(message);
  }
  CustomException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'Request cancelled by user';
        break;
      case DioErrorType.connectTimeout:
        message = 'Connection timed out';
        break;
      case DioErrorType.other:
        message = "Couldn't connect to server";
        break;
      case DioErrorType.receiveTimeout:
        message = 'Response time out';
        break;
      case DioErrorType.response:
        if (dioError.response == null) {
          message = dioError.message;
        } else {
          message = _handleError(dioError.response);
        }
        break;
      case DioErrorType.sendTimeout:
        message = 'Request send time out';
        break;
      default:
        message = 'Ops, something went wrong';
        break;
    }
    LoggerService.instance.logger.e(message);
  }

  String? message;

  String _handleError(Response? res) {
    final statusCode = res!.statusCode;
    switch (statusCode) {
      case 400:
        return 'Bad Request';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Something went wrong';
    }
  }

  @override
  String toString() => message ?? '';
}
