import 'package:flutter/material.dart';
import 'package:merova/generated/app_localizations.dart';

extension TranslationExtension on BuildContext{
  AppLocalizations get tr => AppLocalizations.of(this)!;
}