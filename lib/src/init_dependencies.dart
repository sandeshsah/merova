import 'package:get_it/get_it.dart';
import 'package:auth/src/core/routes/app_router.dart';
import 'package:auth/src/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:auth/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:auth/src/features/auth/domain/repository/auth_repository.dart';
import 'package:auth/src/features/auth/domain/usescase/login_usecase.dart';
import 'package:auth/src/features/auth/domain/usescase/register_usecase.dart';
import 'package:auth/src/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Router
  sl.registerSingleton<AppRouter>(AppRouter());

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasource());

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // Bloc
  sl.registerFactory(() => AuthBloc(loginUseCase: sl(), registerUseCase: sl()));
}
