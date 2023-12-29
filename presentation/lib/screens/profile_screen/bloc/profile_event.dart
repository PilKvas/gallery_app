part of '../profile.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadUserData() = _loadUserData;
}
