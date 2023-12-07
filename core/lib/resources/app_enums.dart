part of '../presentation.dart';

enum Status {
  initial,
  loading,
  success,
  failure,
}

enum Fields {
  emailField('email'),
  emailCanonical('emailCanonical'),
  userNameField('username'),
  userNameCanonical('usernameCanonical'),
  phoneNumberField('phone'),
  passwordField('password'),
  confirmField('confirm');

  final String value;

  const Fields(this.value);

  factory Fields.fromString(String value) {
    return values.where((element) => element.value.startsWith(value)).first;
  }
}

enum FieldsError {
  emptyFieldError,
  emailError,
  passwordError,
  fieldsNotSimilar,
  phoneNumberError,
}
