import 'default_flags.dart';

class FeatureFlags {
  static Map<String, bool> _flags = {};

  static void initialize() {
    _flags = DefaultFlags.getFlags();
  }

  static void setFlags(Map<String, bool> newFlags) {
    _flags.addAll(newFlags);
  }

  static bool isEnabled(String featureName) {
    return _flags[featureName] ?? false;
  }

  static Map<String, bool> all() => Map.from(_flags);
}
