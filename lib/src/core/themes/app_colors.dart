import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primary = Color.fromARGB(255, 20, 111, 160);
  static const Color lightPrimary = Color(0xFF4F8FB0);
  static const Color primaryDark = Color.fromARGB(255, 63, 188, 230);

  // Background
  static const Color background = Color(0xFFA3D5FF);
  static const Color backgroundDark = Color(0xFF0F0F12);
  static const Color transparent = Colors.transparent;

  // Text Colors
  static const Color textPrimary = Color(0xFF0D0D0D);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFFA1A1A1);
  static const Color textWhite = Colors.white;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color greyShade = Color(0xFFE0E0E0);
  static const Color boxShadow = Colors.black12;

  // Borders / Divider
  static const Color border = Color(0xFFE5E7EB);

  //NavButton
  static const navButton = Color(0xFF94A3B8);

  // Status Colors
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFFACC15);

  static const linearGradient = LinearGradient(
    colors: [Color(0xFF147BA0), Color(0xFFE3F2FD)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const homeGradient =  LinearGradient(
    colors: [Color(0xFF147BA0), Color(0xFF3FBCE6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const onBoarding = LinearGradient(
    colors: [background, Color(0xFF147BA0)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
