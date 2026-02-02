import 'package:auto_route/auto_route.dart';
import 'package:merova/src/core/environment/app_environment.dart';
import 'package:merova/src/features/auth/presentation/page/login_page.dart';
import 'package:merova/src/features/auth/presentation/page/otp_page.dart';
import 'package:merova/src/features/auth/presentation/page/register_page.dart';
import 'package:merova/src/features/home/presentation/home_page.dart';
import 'package:merova/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:merova/src/features/profile/presentation/pages/profile_pages.dart';
import 'package:merova/src/features/splash/presentation/pages/splash_page.dart';

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

    AutoRoute(page: ProfileRoutes.page,
    )
  ];
}
