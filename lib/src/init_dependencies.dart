import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:merova/src/core/helper/token_storage.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:merova/src/core/service/dio/dio_client.dart';
import 'package:merova/src/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:merova/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:merova/src/features/auth/domain/repository/auth_repository.dart';
import 'package:merova/src/features/auth/domain/usescase/login_usecase.dart';
import 'package:merova/src/features/auth/domain/usescase/register_usecase.dart';
import 'package:merova/src/features/auth/domain/usescase/verify_otp_usecase.dart';
import 'package:merova/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:merova/src/features/home/data/datasource/home_datasource.dart';
import 'package:merova/src/features/home/data/datasource/home_mock_datasource.dart';
import 'package:merova/src/features/home/data/repository/home_repository_impl.dart';
import 'package:merova/src/features/home/domain/repository/home_repository.dart';
import 'package:merova/src/features/home/domain/usescase/get_transaction_usecase.dart';
import 'package:merova/src/features/home/presentation/bloc/home_bloc.dart';
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

  // Core Services
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());

  // Dio Client
  sl.registerLazySingleton<Dio>(
    () => DioClient.create(
      storage: sl<TokenStorage>(),
      locale: const Locale('en'),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(sl<Dio>()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl()));

  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),
      verifyOtpUseCase: sl(),
    ),
  );

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

  // Home Feature
  // Data Sources
  sl.registerLazySingleton<HomeDataSource>(() => HomeMockDataSource());

  // Repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetTransactionUseCase(sl()));

  // Bloc
  sl.registerFactory(() => HomeBloc(repository: sl()));
}
