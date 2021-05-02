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

  String fromFirebaseErrorCodes(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'The email is badly formatted.';

      case 'unauthorized-domain':
        return 'This domain is not authorized for OAuth.';

      case 'popup-closed-by-user':
        return 'Cancelled by user.';

      case 'account-exists-with-different-credential':
        return 'You already have an account with this email but with different credential.';

      case 'wrong-password':
        return 'Invalid User credentials.';

      case 'network-request-failed':
        return 'Please check your internet connection';

      case 'too-many-requests':
        return 'You inserted wrong login credentials several times. Take a break please!';

      case 'user-disabled':
        return 'Your account has been disabled or deleted. Please contact the system administrator.';

      case 'requires-recent-login':
        return 'Please login again and try again!';

      case 'email-already-exists':
      case 'email-already-in-use':
        return 'Email address is already in use by an existing user.';

      case 'user-not-found':
        return 'We could not find user account associated with the email address or phone number.';

      case 'phone-number-already-exists':
        return 'The phone number is already in use by an existing user.';

      case 'invalid-phone-number':
        return 'The phone number is not a valid phone number!';

      case 'invalid-email  ':
        return 'The email address is not a valid email address!';

      case 'cannot-delete-own-user-account':
        return 'You cannot delete your own user account.';

      case 'aborted':
        return 'Aborted due to errors.';

      case 'already-exists':
        return 'The document already exits.';

      case 'cancelled':
        return 'Cancelled.';

      case 'internal':
        return 'Internal Server Error.';

      case 'permission-denied':
        return "You don't have sufficient permissions. Please login again";

      case 'unauthenticated':
        return 'Your session is expired Please relogin.';

      case 'not-found':
        return 'The Document is not found.';

      case 'object-not-found':
        return 'Could not find the file or the photo.';

      default:
        return 'Oops! Something went wrong. Try again later.';
    }
  }

  @override
  String toString() => message ?? '';
}
