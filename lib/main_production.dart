import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:merova/src/core/environment/app_environment.dart';
import 'package:merova/src/core/environment/feature_flags.dart';
import 'package:merova/src/init_dependencies.dart';

import 'app.dart';
import 'src/core/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set Environment
  AppEnvironment.setProduction();
  FeatureFlags.initialize();

  // Initialize dependencies
  await initDependencies();

  runApp(App(router: GetIt.I<AppRouter>()));
}
