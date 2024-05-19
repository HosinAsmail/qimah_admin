import 'package:equatable/equatable.dart';
import 'package:qimah_admin/data/data%20source/locale/store_user.dart';

class UserModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? accessToken;
  final String? refreshToken;
  final DateTime? expires;

  // Private constructor
  const UserModel._({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.accessToken,
    this.refreshToken,
    this.expires,
  });

  // Static instance
  static UserModel? _instance;

  // Factory constructor to provide the singleton instance
  factory UserModel() {
    _instance ??= StoreUser.getUser() ?? const UserModel._();
    return _instance!;
  }

  // Static method to reset the singleton instance (for testing or logout purposes)
  static void resetInstance() {
    _instance = null;
  }

  // Method to update the singleton instance
  UserModel updateInstance({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? accessToken,
    String? refreshToken,
    DateTime? expires,
  }) {
    _instance = UserModel._(
      id: id ?? _instance!.id,
      name: name ?? _instance!.name,
      email: email ?? _instance!.email,
      phoneNumber: phoneNumber ?? _instance!.phoneNumber,
      accessToken: accessToken ?? _instance!.accessToken,
      refreshToken: refreshToken ?? _instance!.refreshToken,
      expires: expires ?? _instance!.expires,
    );
    return _instance!;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel().updateInstance(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        accessToken: json['accessToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
        expires: json['expires'] == null
            ? null
            : DateTime.parse(json['expires'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'expires': expires?.toIso8601String(),
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
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expires: expires ?? this.expires,
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
      accessToken,
      refreshToken,
      expires,
    ];
  }
}
