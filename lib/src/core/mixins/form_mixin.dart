import 'package:flutter/material.dart';

mixin FormMixin {
  final formKey = GlobalKey<FormState>();

  bool validateForm() => formKey.currentState?.validate() ?? false;
}
