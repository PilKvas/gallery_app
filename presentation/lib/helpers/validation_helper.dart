part of '../presentation.dart';

class ValidationHelper {
  static Map<Fields, FieldsError>? validateEmail(String email) {
    if (email.trim().isEmpty) {
      return {Fields.emailField: FieldsError.emptyFieldError};
    }
    if (!RegExp(AppConst.regExpEmail).hasMatch(email)) {
      return {Fields.emailField: FieldsError.emailError};
    }
    return null;
  }

  static Map<Fields, FieldsError>? validatePassword(String password) {
    if (password.trim().isEmpty) {
      return {Fields.passwordField: FieldsError.emptyFieldError};
    }
    if (password.trim().length < 8) {
      return {Fields.passwordField: FieldsError.passwordError};
    }
    return null;
  }

  static Map<Fields, FieldsError>? isConfirmedPassword(String password, String confirmedPassword) {
    if (password.trim() != confirmedPassword.trim()) {
      return {Fields.confirmField: FieldsError.fieldsNotSimilar};
    }
    return null;
  }

  static Map<Fields, FieldsError>? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.trim().isEmpty) {
      return {Fields.phoneNumberField: FieldsError.emptyFieldError};
    }
    if (phoneNumber.length < 18) {
      return {Fields.phoneNumberField: FieldsError.phoneNumberError};
    }
    return null;
  }

  static Map<Fields, FieldsError>? validateUserName(String userName) {
    if (userName.trim().isEmpty) {
      return {Fields.userNameField: FieldsError.emptyFieldError};
    }
    return null;
  }
}
