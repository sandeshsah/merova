import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String identifier,
    required String password,
  }) = _LoginRequested;

  const factory AuthEvent.registerRequested({
    required String fullName,
    required String phoneNumber,
    required String email,
    required String password,
  }) = _RegisterRequested;

  const factory AuthEvent.verifyOtpRequested({
    required String phoneNumber,
    required String otp,
  }) = _VerifyOtpRequested;

  const factory AuthEvent.logoutRequested() = _LogoutRequested;
}
