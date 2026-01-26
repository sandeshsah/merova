import 'package:flutter/material.dart';
import 'package:auth/app.dart';
import 'package:auth/src/core/environment/app_environment.dart';
import 'package:auth/src/core/environment/feature_flags.dart';
import 'package:auth/src/core/routes/app_router.dart';
import 'package:auth/src/init_dependencies.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set Environment
  AppEnvironment.setStaging();
  FeatureFlags.initialize();

  // Initialize dependencies
  await initDependencies();

  runApp(App(router: GetIt.I<AppRouter>()));
}
