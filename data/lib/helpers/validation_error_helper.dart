part of '../data.dart';

class ValidationErrorHelper {
  static List<ValidationError>? getErrorList(DioException err) {
    final responseData = err.response!.data;

    if (responseData != null) {
      final violations = (responseData as Map<String, dynamic>)['violations'];
      if (violations is List) {
        final mapList = violations.map((element) => element as Map<String, dynamic>).toList();
        return mapList.map(ValidationError.fromJson).toList();
      }
    }
    return null;
  }
}
