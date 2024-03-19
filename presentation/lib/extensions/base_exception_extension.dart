part of '../presentation.dart';

extension BaseExceptionExtension on BaseException {
  ErrorState get errorStatus {
    switch (runtimeType) {
      case BadRequest:
        return ErrorState.badRequest;
      case Forbidden:
        return ErrorState.forbidden;
      case NotFound:
        return ErrorState.notFound;
      case Conflict:
        return ErrorState.conflict;
      case Unauthorized:
        return ErrorState.unauthorized;
      case ServerUnavailable:
      case ServiceTemporarilyUnavailable:
        return ErrorState.serverUnavailable;
      case NoInternetConnection:
        return ErrorState.noInternetConnection;
      case Duplicate:
        return ErrorState.duplicate;
      default:
        return ErrorState.unknown;
    }
  }
}