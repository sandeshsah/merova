import 'package:auth/src/core/enums/app_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usescase/login_usecase.dart';
import '../../domain/usescase/register_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
    : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        loginRequested: (UId, email, password) async {
          if (UId.isEmpty || password.isEmpty) {
            emit(
              state.copyWith(
                status: AuthStatus.error,
                message: "UID or Password cannot be empty",
              ),
            );
            return;
          }

          emit(
            state.copyWith(status: AuthStatus.loading, flow: AuthFlow.login),
          );
          try {
            await loginUseCase(UId, email, password);
            emit(state.copyWith(status: AuthStatus.authenticated));
          } catch (_) {
            emit(
              state.copyWith(status: AuthStatus.error, message: 'Login failed'),
            );
          }
        },
        registerRequested: (UId, email, password) async {
          emit(
            state.copyWith(status: AuthStatus.loading, flow: AuthFlow.register),
          );
          try {
            await registerUseCase(UId, email, password);
            emit(state.copyWith(status: AuthStatus.authenticated));
          } catch (_) {
            emit(
              state.copyWith(
                status: AuthStatus.error,
                message: 'Register failed',
              ),
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