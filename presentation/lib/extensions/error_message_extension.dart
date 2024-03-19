
part of '../presentation.dart';

extension ErrorEnumExtension on ErrorState {
  String message(S localization) {
    switch (this) {
      case ErrorState.badRequest:
        return localization.badRequest;
      case ErrorState.forbidden:
        return localization.forbidden;
      case ErrorState.notFound:
        return localization.notFound;
      case ErrorState.conflict:
        return localization.conflict;
      case ErrorState.unauthorized:
        return localization.unauthorized;
      case ErrorState.serverUnavailable:
        return localization.serverUnavailable;
      case ErrorState.serverTemporaryUnavailable:
        return localization.serverUnavailable;
      case ErrorState.noInternetConnection:
        return localization.noInternetConnection;
      case ErrorState.duplicate:
        return localization.duplicate;
      case ErrorState.timeOut:
        return localization.timeOut;
      case ErrorState.unknown:
        return localization.thereIsSomeProblem;
    }
  }
}