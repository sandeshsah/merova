import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:dio/dio.dart';
import 'package:merova/src/features/auth/domain/entity/auth_entity.dart';
import '../../domain/usescase/login_usecase.dart';
import '../../domain/usescase/register_usecase.dart';
import '../../domain/usescase/verify_otp_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.verifyOtpUseCase,
  }) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        loginRequested: (identifier, password) async {
          if (identifier.isEmpty || password.isEmpty) {
            emit(
              state.copyWith(
                status: AuthStatus.error,
                message: "Identifier or Password cannot be empty",
              ),
            );
            return;
          }

          emit(
            state.copyWith(status: AuthStatus.loading, flow: AuthFlow.login),
          );
          try {
            final user = await loginUseCase(identifier, password);
            emit(state.copyWith(status: AuthStatus.authenticated, user: user));
          } on DioException catch (e) {
            final errorMsg = e.response?.data is Map
                ? (e.response?.data['detail'] ?? e.message)
                : e.message;
            emit(state.copyWith(status: AuthStatus.error, message: errorMsg));
          } catch (e) {
            emit(
              state.copyWith(status: AuthStatus.error, message: e.toString()),
            );
          }
        },
        registerRequested: (fullName, phoneNumber, email, password) async {
          emit(
            state.copyWith(status: AuthStatus.loading, flow: AuthFlow.register),
          );
          try {
            await registerUseCase(fullName, phoneNumber, email, password);
            emit(
              state.copyWith(
                status: AuthStatus.authenticated,
                user: AuthEntity(
                  UId: '',
                  email: email,
                  fullName: fullName,
                  password: password,
                ),
              ),
            );
          } on DioException catch (e) {
            final errorMsg = e.response?.data is Map
                ? (e.response?.data['detail'] ?? e.message)
                : e.message;
            emit(state.copyWith(status: AuthStatus.error, message: errorMsg));
          } catch (e) {
            emit(
              state.copyWith(status: AuthStatus.error, message: e.toString()),
            );
          }
        },
        logoutRequested: () async {
          emit(state.copyWith(status: AuthStatus.loading));
          try {
            emit(AuthState.initial());
          } catch (e) {
            emit(
              state.copyWith(status: AuthStatus.error, message: e.toString()),
            );
          }
        },
        verifyOtpRequested: (phoneNumber, otp) async {
          emit(state.copyWith(status: AuthStatus.loading));
          try {
            await verifyOtpUseCase(phoneNumber, otp);
            emit(state.copyWith(status: AuthStatus.authenticated));
          } on DioException catch (e) {
            final errorMsg = e.response?.data is Map
                ? (e.response?.data['detail'] ?? e.message)
                : e.message;
            emit(state.copyWith(status: AuthStatus.error, message: errorMsg));
          } catch (e) {
            emit(
              state.copyWith(status: AuthStatus.error, message: e.toString()),
            );
          }
        },
      );
    });
  }
}




//import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../domain/usescase/login_usecase.dart';
// import '../../domain/usescase/register_usecase.dart';
// import 'auth_event.dart';
// import 'auth_state.dart';
//
// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final LoginUseCase loginUseCase;
//   final RegisterUseCase registerUseCase;
//
//   AuthBloc(this.loginUseCase, this.registerUseCase)
//     : super( AuthState.initial()) {
//     on<AuthEvent>((event, emit) async {
//       await event.when(
//         loginRequested: (UId, email, password) async {
//           emit(const AuthState.loading());
//           try {
//             await loginUseCase(UId, email, password);
//             emit(const AuthState.success());
//           } catch (e) {
//             emit(const AuthState.error('Login failed'));
//           }
//         },
//         registerRequested: (UId, email, password) async {
//           emit(const AuthState.loading());
//           try {
//             await registerUseCase(UId, email, password);
//             emit(const AuthState.success());
//           } catch (e) {
//             emit(const AuthState.error('Registration failed'));
//           }
//         },
//       );
//     });
//   }
// }