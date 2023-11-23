import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String username;
  final String password;

  const AuthParams({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
