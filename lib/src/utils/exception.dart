import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';
import '../../ismails_utils.dart';

class IsmailException with IsmailLoggerMixin implements Exception {
  /// return IsmailException from object
  IsmailException.error(Object? e) {
    message = e.toString();
  }

  /// return IsmailException from DioError
  IsmailException.fromDioError(DioError dioError) {
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
        if (res.data['error'] != null) {
          return res.data['error'];
        }
        return 'Bad Request';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Something went wrong';
    }
  }

  /// returns the messege
  @override
  String toString() => message ?? '';
}

abstract class IsmailFirebaseException implements Exception {
  String? message;
  @override
  String toString() => message ?? '';
  String? get onInvalidEmail => null;
  String? get unAuthDomain => null;
  String? get oAuthCanceled => null;
  String? get accountExistsWithDifferentCred => null;
  String? get wrongPass => null;
  String? get networkFailure => null;
  String? get tooManyReqs => null;
  String? get disabled => null;
  String? get reLogin => null;
  String? get emailExists => null;
  String? get userNotFound => null;
  String? get phoneExists => null;
  String? get invalidPhone => null;
  String? get invalidEmail => null;
  String? get deleteOwnAcc => null;
  String? get aborted => null;
  String? get docExists => null;
  String? get permDenied => null;
  String? get unAuth => null;
  String? get docNotFound => null;
  String? get objNotFound => null;
  String? get genericError => null;

  /// return IsmailException from FromFirebaseErrorCodes
  IsmailFirebaseException.fromFirebaseErrorCodes(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        message = onInvalidEmail ?? 'The email is badly formatted.';
        break;
      case 'unauthorized-domain':
        message = unAuthDomain ?? 'This domain is not authorized for OAuth.';
        break;
      case 'popup-closed-by-user':
        message = oAuthCanceled ?? 'Cancelled by user.';
        break;
      case 'account-exists-with-different-credential':
        message = accountExistsWithDifferentCred ??
            'You already have an account with this email but with different credential.';
        break;
      case 'wrong-password':
        message = wrongPass ?? 'Invalid User credentials.';
        break;
      case 'network-request-failed':
        message = networkFailure ?? 'Please check your internet connection';
        break;
      case 'too-many-requests':
        message = tooManyReqs ??
            'You inserted wrong login credentials several times. Take a break please!';
        break;
      case 'user-disabled':
        message = disabled ??
            'Your account has been disabled or deleted. Please contact the system administrator.';
        break;
      case 'requires-recent-login':
        message = reLogin ?? 'Please login again and try again!';
        break;
      case 'email-already-exists':
      case 'email-already-in-use':
        message = emailExists ??
            'Email address is already in use by an existing user.';
        break;
      case 'user-not-found':
        message = userNotFound ??
            'We could not find user account associated with the email address or phone number.';
        break;
      case 'phone-number-already-exists':
        message = phoneExists ??
            'The phone number is already in use by an existing user.';
        break;
      case 'invalid-phone-number':
        message =
            invalidPhone ?? 'The phone number is not a valid phone number!';
        break;
      case 'invalid-email  ':
        message =
            invalidEmail ?? 'The email address is not a valid email address!';
        break;
      case 'cannot-delete-own-user-account':
        message = deleteOwnAcc ?? 'You cannot delete your own user account.';
        break;
      case 'aborted':
        message = aborted ?? 'Aborted due to errors.';
        break;
      case 'already-exists':
        message = docExists ?? 'The document already exits.';
        break;
      case 'permission-denied':
        message = permDenied ??
            "You don't have sufficient permissions. Please login again";
        break;
      case 'unauthenticated':
        message = unAuth ?? 'Your session is expired Please relogin.';
        break;
      case 'not-found':
        message = docNotFound ?? 'The Document is not found.';
        break;
      case 'object-not-found':
        message = objNotFound ?? 'Could not find the file or the photo.';
        break;
      default:
        message =
            genericError ?? 'Oops! Something went wrong. Try again later.';
        break;
    }
  }
}
