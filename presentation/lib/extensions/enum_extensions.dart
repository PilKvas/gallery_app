part of '../presentation.dart';

extension FieldErrorExtension on FieldsError {
  String getLocalizedTitle(S localization) {
    return switch (this) {
      FieldsError.emptyFieldError => localization.emptyFieldValidationText,
      FieldsError.emailError => localization.emailValidationText,
      FieldsError.passwordError => localization.passwordValidationText,
      FieldsError.fieldsNotSimilar => localization.confirmFieldValidationText,
      FieldsError.phoneNumberError => localization.phoneValidationText,
    };
  }
}
