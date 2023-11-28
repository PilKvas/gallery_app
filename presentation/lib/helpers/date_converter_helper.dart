part of '../presentation.dart';

class DateConverterHelper {
  static String convertDate(DateTime? dateTime) {
    if (dateTime != null) {
      return DateFormat('dd.MM.yyyy').format(dateTime);
    }
    return '';
  }
}
