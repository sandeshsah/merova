import 'package:auth/src/core/enums/app_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStatus status,
    required AuthFlow flow,
    String? message,
  }) = _AuthState;

  factory AuthState.initial() =>
      AuthState(status: AuthStatus.unauthenticated, flow: AuthFlow.login);
}





//import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'auth_state.freezed.dart';
//
// @freezed
// class AuthState with _$AuthState {
//   const factory AuthState.initial() = _Initial;
//   const factory AuthState.loading() = _Loading;
//   const factory AuthState.success() = _Success;
//   const factory AuthState.error(String message) = _Error;
// }