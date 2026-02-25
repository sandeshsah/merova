import 'app_environment.dart';

class DefaultFlags {
  static Map<String, bool> getFlags() {
    switch (AppEnvironment.current) {
      case Environment.dev:
        return {
          'new_chat_ui': true,
          'analytics': false,
          'stories': true,
          'use_mock_data': true,
        };
      case Environment.staging:
        return {
          'new_chat_ui': true,
          'analytics': true,
          'stories': true,
          'use_mock_data': true,
        };
      case Environment.prod:
        return {
          'new_chat_ui': false,
          'analytics': true,
          'stories': false,
          'use_mock_data': false,
        };
    }
  }
}
