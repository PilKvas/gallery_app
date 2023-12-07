part of '../presentation.dart';

class InputFormatters {
  static final phoneMask = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {'#': RegExp('[0-9]')},
  );
}
