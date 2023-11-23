import 'package:dio/dio.dart';

import '../../env/env_config.dart';

Dio getApiClient() {
  final client = Dio(BaseOptions(baseUrl: EnvConfig.baseUrl));

  client.interceptors.add(LogInterceptor());

  return client;
}
