import 'dart:convert';
import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String password;
  final String email;

  const LoginModel({
    required this.password,
    required this.email,
  });

  @override
  List<Object?> get props => [password, email];

  LoginModel copyWith({
    String? password,
    String? email,
  }) {
    return LoginModel(
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'email': email,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      password: map['password'],
      email: map['email'],
    );
  }
}
