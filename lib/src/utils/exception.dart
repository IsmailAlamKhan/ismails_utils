import 'package:dio/dio.dart';

class CustomException implements Exception {
  CustomException.error(dynamic e) {
    message = e.toString();
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

  CustomException.fromFirebaseErrorCodes(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        message = 'The email is badly formatted.';
        break;
      case 'unauthorized-domain':
        message = 'This domain is not authorized for OAuth.';
        break;
      case 'popup-closed-by-user':
        message = 'Cancelled by user.';
        break;
      case 'account-exists-with-different-credential':
        message =
            'You already have an account with this email but with different credential.';
        break;
      case 'wrong-password':
        message = 'Invalid User credentials.';
        break;
      case 'network-request-failed':
        message = 'Please check your internet connection';
        break;
      case 'too-many-requests':
        message =
            'You inserted wrong login credentials several times. Take a break please!';
        break;
      case 'user-disabled':
        message =
            'Your account has been disabled or deleted. Please contact the system administrator.';
        break;
      case 'requires-recent-login':
        message = 'Please login again and try again!';
        break;
      case 'email-already-exists':
      case 'email-already-in-use':
        message = 'Email address is already in use by an existing user.';
        break;
      case 'user-not-found':
        message =
            'We could not find user account associated with the email address or phone number.';
        break;
      case 'phone-number-already-exists':
        message = 'The phone number is already in use by an existing user.';
        break;
      case 'invalid-phone-number':
        message = 'The phone number is not a valid phone number!';
        break;
      case 'invalid-email  ':
        message = 'The email address is not a valid email address!';
        break;
      case 'cannot-delete-own-user-account':
        message = 'You cannot delete your own user account.';
        break;
      case 'aborted':
        message = 'Aborted due to errors.';
        break;
      case 'already-exists':
        message = 'The document already exits.';
        break;
      case 'cancelled':
        message = 'Cancelled.';
        break;
      case 'internal':
        message = 'Internal Server Error.';
        break;
      case 'permission-denied':
        message = "You don't have sufficient permissions. Please login again";
        break;
      case 'unauthenticated':
        message = 'Your session is expired Please relogin.';
        break;
      case 'not-found':
        message = 'The Document is not found.';
        break;
      case 'object-not-found':
        message = 'Could not find the file or the photo.';
        break;
      default:
        message = 'Oops! Something went wrong. Try again later.';
        break;
    }
  }

  @override
  String toString() => message ?? '';
}
