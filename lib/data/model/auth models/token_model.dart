// ignore_for_file: public_member_api_docs, sort_constructors_first
// lib/models/token.dart

class TokenModel {
  String? accessToken;
  String? refreshToken;
  String? expires;

  // Constructor
  TokenModel({this.accessToken, this.refreshToken, this.expires});

  // Factory method to create a Token from a JSON map
  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expires: json['expires'],
    );
  }
  TokenModel fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expires: json['expires'],
    );
  }
  // Method to convert a Token to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expires': expires,
    };
  }

  @override
  String toString() => 'TokenModel(accessToken: $accessToken, refreshToken: $refreshToken, expires: $expires)';
}
