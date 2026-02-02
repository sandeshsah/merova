import 'package:auth/src/core/localization/localization_cubit.dart';
import 'package:auth/src/core/themes/app_colors.dart';
import 'package:auth/src/core/themes/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Language Selection
          BlocBuilder<LocalizationCubit, Locale>(
            builder: (context, locale) {
              return TextButton.icon(
                onPressed: () => _showLanguageDialog(context, locale),
                icon: Icon(Icons.language, color: AppColors.white, size: 20.sp),
                label: Text(
                  locale.languageCode.toUpperCase(),
                  style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                ),
              );
            },
          ),

          // Theme Switch
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return IconButton(
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                icon: Icon(
                  themeMode == ThemeMode.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, Locale currentLocale) {
    showDialog(
      context: context,
      //barrierColor: AppColors.grey,
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('English'),
              trailing: currentLocale.languageCode == 'en'
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                context.read<LocalizationCubit>().changeLanguage(
                  const Locale('en'),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Nepali'),
              trailing: currentLocale.languageCode == 'ne'
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                context.read<LocalizationCubit>().changeLanguage(
                  const Locale('ne'),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
