import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:target/models/auth_data_model.dart';
import 'package:target/models/user_model.dart';
import 'package:target/models/user_response_model.dart';

class AuthRepository {
  final Dio client;

  AuthRepository({required this.client});

  Future<Either<String, User>> login(AuthParams data) async {
    final response = await client.get('/users');

    bool shouldFail = response.data == null || response.statusCode != 200;
    if (shouldFail) return const Left('Erro ao buscar usuário');

    final users = (response.data as List)
        .map((user) => UserResponse.fromJson(user as Map<String, dynamic>))
        .toList(growable: false);

    final user = users.firstWhereOrNull((user) {
      bool matchUsername = user.username == data.username;
      bool matchPassword = user.password == data.password;
      return matchUsername && matchPassword;
    });

    if (user == null) return const Left('Usuário não encontrado');

    return Right(User(id: user.id, username: user.username));
  }
}
