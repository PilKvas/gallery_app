part of '../data.dart';

class ValidationErrorHelps {
  static List<ValidationError>? getErrorList(DioException err) {
    final responseData = err.response!.data;

    if (responseData != null) {
      final violations = (responseData as Map<String, dynamic>)['violations'];

      final mapList = (violations as List).map((element) => element as Map<String, dynamic>).toList();

      return mapList.map(ValidationError.fromJson).toList();
    }
    return null;
  }
}
