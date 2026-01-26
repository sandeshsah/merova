import 'dev.dart';
import 'staging.dart';
import 'prod.dart';

enum Environment { dev, staging, prod }

class AppEnvironment {
  static late Environment current;
  static late _Config _config;

  // Set environment
  static void setDev({String? initialRoute}) {
    current = Environment.dev;
    _config = _Config(
      baseUrl: DevConfig.baseUrl,
      connectTimeout: DevConfig.connectTimeout,
      receiveTimeout: DevConfig.receiveTimeout,
      isDebug: DevConfig.isDebug,
      envName: DevConfig.envName,
      initialRoute: initialRoute,
    );
  }

  static void setStaging() {
    current = Environment.staging;
    _config = _Config(
      baseUrl: StagingConfig.baseUrl,
      connectTimeout: StagingConfig.connectTimeout,
      receiveTimeout: StagingConfig.receiveTimeout,
      isDebug: StagingConfig.isDebug,
      envName: StagingConfig.envName,
    );
  }

  static void setProduction() {
    current = Environment.prod;
    _config = _Config(
      baseUrl: ProdConfig.baseUrl,
      connectTimeout: ProdConfig.connectTimeout,
      receiveTimeout: ProdConfig.receiveTimeout,
      isDebug: ProdConfig.isDebug,
      envName: ProdConfig.envName,
    );
  }

  // Expose config
  static String get baseUrl => _config.baseUrl;
  static int get connectTimeout => _config.connectTimeout;
  static int get receiveTimeout => _config.receiveTimeout;
  static bool get isDebug => _config.isDebug;
  static String get envName => _config.envName;
  static String? get initialRoute => _config.initialRoute;
}

// ✅ private config class (top-level)
class _Config {
  final String baseUrl;
  final int connectTimeout;
  final int receiveTimeout;
  final bool isDebug;
  final String envName;
  final String? initialRoute;

  _Config({
    required this.baseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.isDebug,
    required this.envName,
    this.initialRoute,
  });
}
