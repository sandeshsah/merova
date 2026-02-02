import 'package:get_it/get_it.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:merova/src/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:merova/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:merova/src/features/auth/domain/repository/auth_repository.dart';
import 'package:merova/src/features/auth/domain/usescase/login_usecase.dart';
import 'package:merova/src/features/auth/domain/usescase/register_usecase.dart';
import 'package:merova/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:merova/src/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:merova/src/features/profile/data/repository/profile_repository_impl.dart';
import 'package:merova/src/features/profile/domain/repository/profile_repository.dart';
import 'package:merova/src/features/profile/domain/usecase/get_User_Profile.dart';
import 'package:merova/src/features/profile/domain/usecase/update_profile.dart';
import 'package:merova/src/features/profile/presentation/bloc/profile_bloc.dart';

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

  // Profile Feature
  // Data Sources
  sl.registerLazySingleton(() => ProfileRemoteDataSource());

  // Repositories
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetUserProfile(sl()));
  sl.registerLazySingleton(() => UpdateProfile(sl()));

  // Bloc
  sl.registerFactory(
    () => ProfileBloc(getUserProfile: sl(), updateProfile: sl()),
  );
}
