part of '../data.dart';

@freezed
class ValidationError with _$ValidationError {
  const factory ValidationError({
    required String propertyPath,
    required String message,
  }) = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
