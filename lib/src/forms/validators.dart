import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

abstract class IsmailFormValidators {
  /// {@template IsmailFormValidators.compose}
  /// FormFieldValidator from a list of validators
  /// {@endtemplate}
  static FormFieldValidator<T> compose<T>(
    List<FormFieldValidator<T>> validators,
  ) {
    return (valueCandidate) {
      for (final validator in validators) {
        final validatorResult = validator.call(valueCandidate);
        if (validatorResult != null) {
          return validatorResult;
        }
      }
      return null;
    };
  }

  static FormFieldValidator<T> required<T>([String? errorText]) {
    return (T? valueCandidate) {
      if (valueCandidate == null ||
          (valueCandidate is String && valueCandidate.isEmpty) ||
          (valueCandidate is Iterable && valueCandidate.isEmpty) ||
          (valueCandidate is Map && valueCandidate.isEmpty)) {
        return errorText ?? 'This field is required';
      }
      return null;
    };
  }

  static FormFieldValidator<String> email([String? errorText]) {
    return (String? valueCandidate) {
      if (valueCandidate != null) {
        if (isEmail(valueCandidate)) {
          return errorText ?? 'This field requires a valid email';
        }
      }
    };
  }

  static FormFieldValidator<String> url([String? errorText]) {
    return (String? valueCandidate) {
      if (valueCandidate != null) {
        if (isURL(valueCandidate)) {
          return errorText ?? 'This field requires a valid url';
        }
      }
    };
  }

  static FormFieldValidator<String> ip([String? errorText]) {
    return (String? valueCandidate) {
      if (valueCandidate != null) {
        if (isIP(valueCandidate)) {
          return errorText ?? 'This field requires a valid ip-address';
        }
      }
    };
  }

  static FormFieldValidator<String> fqdn([String? errorText]) {
    return (String? valueCandidate) {
      if (valueCandidate != null) {
        if (isFQDN(valueCandidate)) {
          return errorText ?? 'This field requires a valid FQDN';
        }
      }
    };
  }

  static FormFieldValidator<String> numeric([String? errorText]) {
    return (String? valueCandidate) {
      if (valueCandidate != null) {
        if (isNumeric(valueCandidate)) {
          return errorText ?? 'This field has to contain only numeric values';
        }
      }
    };
  }

  static FormFieldValidator<String> alphaNumeric([String? errorText]) {
    return (String? valueCandidate) {
      if (valueCandidate != null) {
        if (isAlphanumeric(valueCandidate)) {
          return errorText ??
              'This field has to contain only alphanumeric values';
        }
      }
    };
  }
}
