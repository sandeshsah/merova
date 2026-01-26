import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleService {
  LocaleService._();
  static final LocaleService instance = LocaleService._();

  static const String _languageCodeKey = 'language_code';

  /// list supported locales
  final List<Locale> supportedLocales = const [Locale('en'), Locale('ne')];

  /// save selected locale
  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageCodeKey, locale.languageCode);
  }

  /// load saved locale (or fallback)
  Future<Locale> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_languageCodeKey);

    if (code == null) return const Locale('en');

    return Locale(code);
  }

  /// used inside MaterialApp builders
  Locale? localeResolutionCallback(Locale? locale, Iterable<Locale> supported) {
    if (locale == null) return supported.first;

    for (final supportedLocale in supported) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }
    return supported.first;
  }
}
