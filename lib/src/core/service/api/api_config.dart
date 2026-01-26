class ApiConfig {
  static late String baseUrl;

  static void init(String env){
    switch(env){
      case 'dev':
      baseUrl = "https://dev.api.mychat.com";
      break;

      case 'staging':
      baseUrl = 'https://staging.api.mychat.com';
      break;

      default:
      baseUrl = 'https://api.mychat.com';
    }
  }
}