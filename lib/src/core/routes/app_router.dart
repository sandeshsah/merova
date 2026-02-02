import 'package:auth/src/features/auth/presentation/page/login_page.dart';
import 'package:auth/src/features/auth/presentation/page/otp_page.dart';
import 'package:auth/src/features/auth/presentation/page/register_page.dart' show RegisterPage;
import 'package:auth/src/features/home/presentation/home_page.dart';
import 'package:auth/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:auth/src/features/splash/presentation/pages/splash_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auth/src/core/environment/app_environment.dart';


part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      initial: AppEnvironment.initialRoute == null ||
          AppEnvironment.initialRoute == 'splash',
    ),
    AutoRoute(
      page: OnboardingRoute.page,
      initial: AppEnvironment.initialRoute == 'onboarding',
    ),
    AutoRoute(
      page: LoginRoute.page,
      initial: AppEnvironment.initialRoute == "login",
    ),
    AutoRoute(
      page: RegisterRoute.page,
      initial: AppEnvironment.initialRoute == 'register',
    ),
    AutoRoute(page: OtpRoute.page,
      initial: AppEnvironment.initialRoute == 'otp',),
    AutoRoute(
    page: HomeRoute.page,
    initial: AppEnvironment.initialRoute == 'home',
    ),
  ];
}
