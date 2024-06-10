import 'package:equatable/equatable.dart';
import 'package:qimah_admin/data/data%20source/locale/store_user.dart';

class UserModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;

  // Private constructor
  const UserModel._({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
  });

  // Static instance
   static  UserModel instance=const UserModel._();

  // Factory constructor to provide the singleton instance
  factory UserModel.init() {
    instance = StoreUser.getUser() ?? const UserModel._();
    return instance;
  }
  // Method to update the singleton instance
  UserModel updateInstance({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
  }) {
    instance = UserModel._(
      id: id ?? instance.id,
      name: name ?? instance.name,
      email: email ?? instance.email,
      phoneNumber: phoneNumber ?? instance.phoneNumber,
    );
    return instance;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      instance.updateInstance(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
      };

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? accessToken,
    String? refreshToken,
    DateTime? expires,
  }) {
    return UserModel._(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phoneNumber,
    ];
  }
}
