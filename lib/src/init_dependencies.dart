import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loyalty/loyalty.dart' hide AuthBloc;
import 'package:merova/src/core/helper/token_storage.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:merova/src/core/service/dio/dio_client.dart';
import 'package:merova/src/core/environment/feature_flags.dart';
import 'package:merova/src/core/service/security_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:merova/src/features/auth/data/datasource/auth_datasource.dart';
import 'package:merova/src/features/auth/data/datasource/auth_mock_datasource.dart';
import 'package:merova/src/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:merova/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:merova/src/features/auth/domain/repository/auth_repository.dart';
import 'package:merova/src/features/auth/domain/usescase/login_usecase.dart';
import 'package:merova/src/features/auth/domain/usescase/register_usecase.dart';
import 'package:merova/src/features/auth/domain/usescase/verify_otp_usecase.dart';
import 'package:merova/src/features/auth/domain/usescase/forgot_password_usecase.dart';
import 'package:merova/src/features/auth/domain/usescase/reset_password_usecase.dart';
import 'package:merova/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:merova/src/features/home/data/datasource/home_datasource.dart';
import 'package:merova/src/features/home/data/datasource/home_mock_datasource.dart';
import 'package:merova/src/features/home/data/datasource/home_remote_datasource.dart';
import 'package:merova/src/features/home/data/repository/home_repository_impl.dart';
import 'package:merova/src/features/home/domain/repository/home_repository.dart';
import 'package:merova/src/features/home/domain/usescase/get_transaction_usecase.dart';
import 'package:merova/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:merova/src/features/profile/data/datasource/profile_datasource.dart';
import 'package:merova/src/features/profile/data/datasource/profile_mock_datasource.dart';
import 'package:merova/src/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:merova/src/features/profile/data/repository/profile_repository_impl.dart';
import 'package:merova/src/features/profile/domain/repository/profile_repository.dart';
import 'package:merova/src/features/profile/domain/usecase/get_User_Profile.dart';
import 'package:merova/src/features/profile/domain/usecase/update_profile.dart';
import 'package:merova/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:merova/src/features/payment/data/datasource/payment_datasource.dart';
import 'package:merova/src/features/payment/data/datasource/payment_mock_datasource.dart';
import 'package:merova/src/features/payment/data/datasource/payment_remote_datasource.dart';
import 'package:merova/src/features/payment/data/repository/payment_repository_impl.dart';
import 'package:merova/src/features/payment/domain/repository/payment_repository.dart';
import 'package:merova/src/features/payment/domain/usescase/get_payment_categories_usecase.dart';
import 'package:merova/src/features/payment/domain/usescase/get_payment_services_usecase.dart';
import 'package:merova/src/features/payment/domain/usescase/process_payment_usecase.dart';
import 'package:merova/src/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:merova/src/features/fund/data/datasource/fund_transfer_datasource.dart';
import 'package:merova/src/features/fund/data/datasource/fund_transfer_mock_datasource.dart';
import 'package:merova/src/features/fund/data/datasource/fund_transfer_remote_datasource.dart';
import 'package:merova/src/features/fund/data/repository/fund_transfer_repository_impl.dart';
import 'package:merova/src/features/fund/domain/repository/fund_transfer_repository.dart';
import 'package:merova/src/features/fund/domain/usescase/get_recent_contacts_usecase.dart';
import 'package:merova/src/features/fund/domain/usescase/perform_transfer_usecase.dart';
import 'package:merova/src/features/fund/presentation/bloc/fund_transfer_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Initialize Loyalty SDK
  await initializeLoyaltySDK(
    apiBaseUrl: 'https://api.loyalty.example.com/v1',
    enableLogging: true,
  );
  try {
    await LoyaltyMethodChannel.initializeSDK(
      apiBaseUrl: 'https://api.loyalty.example.com/v1',
      enableLogging: true,
    );
  } catch (e) {
    debugPrint('Loyalty native initialization skipped: $e');
  }

  // External
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // Router
  sl.registerSingleton<AppRouter>(AppRouter());

  // Core Services
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());
  sl.registerLazySingleton<SecurityService>(
    () => SecurityService(sl<SharedPreferences>()),
  );

  // Dio Client
  sl.registerLazySingleton<Dio>(
    () => DioClient.create(
      storage: sl<TokenStorage>(),
      locale: const Locale('en'),
    ),
  );

  // Determine if we should use mock data
  final useMock = FeatureFlags.isEnabled('use_mock_data');

  // Auth Feature
  // Data Sources
  sl.registerLazySingleton<AuthDataSource>(
    () => useMock ? AuthMockDataSource() : AuthRemoteDatasource(sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));

  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),
      verifyOtpUseCase: sl(),
      forgotPasswordUseCase: sl(),
      resetPasswordUseCase: sl(),
    ),
  );

  // Profile Feature
  // Data Sources
  sl.registerLazySingleton<ProfileDataSource>(
    () => useMock ? ProfileMockDataSource() : ProfileRemoteDataSource(),
  );

  // Repositories
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl<ProfileDataSource>()),
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
  sl.registerLazySingleton<HomeDataSource>(
    () => useMock ? HomeMockDataSource() : HomeRemoteDataSource(sl()),
  );

  // Repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetTransactionUseCase(sl()));

  // Bloc
  sl.registerFactory(() => HomeBloc(repository: sl()));

  // Payment Feature
  // Data Sources
  sl.registerLazySingleton<PaymentDataSource>(
    () => useMock ? PaymentMockDataSource() : PaymentRemoteDataSource(sl()),
  );

  // Repositories
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(sl<PaymentDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetPaymentCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetPaymentServicesUseCase(sl()));
  sl.registerLazySingleton(() => ProcessPaymentUseCase(sl()));

  // Bloc
  sl.registerFactory(
    () => PaymentBloc(
      getCategoriesUseCase: sl(),
      getServicesUseCase: sl(),
      processPaymentUseCase: sl(),
    ),
  );

  // Fund Transfer Feature
  // Data Sources
  sl.registerLazySingleton<FundTransferDataSource>(
    () => useMock
        ? FundTransferMockDataSource()
        : FundTransferRemoteDataSource(sl()),
  );

  // Repositories
  sl.registerLazySingleton<FundTransferRepository>(
    () => FundTransferRepositoryImpl(sl<FundTransferDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetRecentContactsUseCase(sl()));
  sl.registerLazySingleton(() => PerformTransferUseCase(sl()));

  // Bloc
  sl.registerFactory(
    () => FundTransferBloc(
      getRecentContactsUseCase: sl(),
      performTransferUseCase: sl(),
    ),
  );
}
