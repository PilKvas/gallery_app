part of '../presentation.dart';

extension DateTimeExtension on DateTime {
  String get formatDate => DateFormat('dd.MM.yyyy').format(this);
}
