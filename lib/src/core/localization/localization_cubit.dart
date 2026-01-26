import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'locale_service.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit() : super(const Locale('en')) {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final locale = await LocaleService.instance.getSavedLocale();
    emit(locale);
  }

  Future<void> changeLanguage(Locale locale) async {
    await LocaleService.instance.setLocale(locale);
    emit(locale);
  }
}
