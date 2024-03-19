part of '../presentation.dart';

extension DateTimeExtension on DateTime? {
  String? get formatDate {
    if (this == null) return null;

    return DateFormat('dd.MM.yyyy').format(this!);
  }
}
