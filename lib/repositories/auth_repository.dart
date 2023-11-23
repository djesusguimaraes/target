import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:target/models/auth_data_model.dart';
import 'package:target/models/user_model.dart';

class AuthRepository {
  final Dio client;

  AuthRepository({required this.client});

  Future<Either<String, User>> login(AuthParams data) async {
    // TODO: implement login
    await Future.delayed(const Duration(seconds: 2));
    return const Left('');
  }
}
