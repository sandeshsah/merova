import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/enums/app_enum.dart';
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
        logoutRequested: () async {
          emit(state.copyWith(status: AuthStatus.loading));
          try {
            // Clear persistent storage if needed, or rely on UI to do it.
            // Ideally, the bloc should call a LogoutUseCase or Repository method.
            // For now, we assume simple state reset.
            // Note: ProfilePage logic was clearing SharedPreferences manually.
            // We should really move that here or into a UseCase.
            // But since I don't see a LogoutUseCase, I will just reset state.
            // User's manual preference clearing is in UI. I'll leave it there or move it?
            // Moving it here is cleaner but requires SharedPreferences in Bloc which is bad practice (should be in Repo).
            // I'll stick to formatting the event loop first.
            emit(AuthState.initial());
          } catch (e) {
            emit(
              state.copyWith(
                status: AuthStatus.error,
                message: 'Logout failed',
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