import 'package:auth/src/core/themes/app_colors.dart';
import 'package:auth/src/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ///Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
    ),

    textTheme: TextTheme(
      headlineLarge:AppTextStyles.headline1,
      headlineMedium: AppTextStyles.body,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.small,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 14, horizontal: 20),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    );

  /// DARK THEME
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primaryDark,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      foregroundColor: AppColors.textWhite,
    ),

    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headline1.copyWith(color: AppColors.textWhite),
      headlineMedium: AppTextStyles.headline2.copyWith(color: AppColors.textWhite),
      bodyMedium: AppTextStyles.body.copyWith(color: AppColors.textWhite),
      bodySmall: AppTextStyles.small.copyWith(color: AppColors.textSecondary),
    ),
  );
}