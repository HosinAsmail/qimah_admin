import 'dart:convert';
import 'package:equatable/equatable.dart';

class SignUpModel extends Equatable {
  final String name;
  final String password;
  final String email;
  final String phoneNumber;

  const SignUpModel({
    required this.name,
    required this.password,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [name, password, email, phoneNumber];

  SignUpModel copyWith({
    String? name,
    String? password,
    String? email,
    String? phoneNumber,
  }) {
    return SignUpModel(
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  String toJson() => jsonEncode(toMap());
  // String fromJson() => jsonDecode(fromMap);
  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      name: map['name'],
      password: map['password'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
    );
  }
}
