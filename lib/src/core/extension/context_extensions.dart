import 'package:auth/generated/app_localizations.dart';
import 'package:flutter/material.dart';

extension TranslationExtension on BuildContext{
  AppLocalizations get tr => AppLocalizations.of(this)!;
}