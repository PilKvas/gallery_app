part of '../presentation.dart';


extension ContextExtensions on BuildContext{
  Size get screenSize => MediaQuery.of(this).size;

  S get localization => S.of(this);

  ThemeData get styling => Theme.of(this);

}


