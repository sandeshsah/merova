import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'generated/app_localizations.dart';
import 'src/core/localization/localization_cubit.dart';
import 'src/core/routes/app_router.dart';
import 'src/core/themes/app_theme.dart';
import 'src/core/themes/theme_cubit.dart';
import 'src/init_dependencies.dart';
import 'src/features/auth/presentation/bloc/auth_bloc.dart';

class App extends StatelessWidget {
  final AppRouter router;
  const App({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LocalizationCubit()),
            BlocProvider(create: (context) => ThemeCubit()),
            BlocProvider(create: (context) => sl<AuthBloc>()),
          ],
          child: BlocBuilder<LocalizationCubit, Locale>(
            builder: (context, locale) {
              return BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, themeMode) {
                  return MaterialApp.router(
                    routerConfig: router.config(),
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode: themeMode,

                    // Localization
                    locale: locale,
                    supportedLocales: const [Locale('en'), Locale('ne')],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
