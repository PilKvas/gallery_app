part of '../presentation.dart';

class DateConverterHelper {
  static String convertDate(DateTime dateTime) {
      return DateFormat('dd.MM.yyyy').format(dateTime);
  }
}
