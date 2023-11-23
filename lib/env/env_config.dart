class EnvConfig {
  static String get baseUrl =>
      const String.fromEnvironment('BASE_URL', defaultValue: 'https://655e63309722d515ea16581f.mockapi.io/api/');
}
