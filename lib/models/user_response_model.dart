import 'package:equatable/equatable.dart';

class UserResponse extends Equatable {
  final String id;
  final String username;
  final String password;
  final DateTime createdAt;

  const UserResponse({
    required this.id,
    required this.username,
    required this.password,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, username, password, createdAt];

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  UserResponse copyWith({
    String? id,
    String? username,
    String? password,
    DateTime? createdAt,
  }) {
    return UserResponse(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
