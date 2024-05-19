import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qimah_admin/core/constant/app_links.dart';
import 'package:qimah_admin/data.dart';
import 'package:qimah_admin/data/data%20source/locale/store_token.dart';
import 'package:qimah_admin/data/data%20source/locale/store_user.dart';
import 'package:qimah_admin/data/model/auth%20models/token_model.dart';
import 'package:qimah_admin/data/model/user_model.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;
  AppInterceptors(
      {required this.secureStorage,
      required this.dio,
      required this.tokenModel});
  final FlutterSecureStorage secureStorage;
  final TokenModel tokenModel;
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.acceptHeader] = ContentType.json;
    tokenModel.accessToken ??= await secureStorage.read(key: "access-token");
    if (tokenModel.accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] =
          "Bearer ${tokenModel.accessToken}";
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    logger.e(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      await StoreToken.getToken();
      if (tokenModel.accessToken != null && tokenModel.refreshToken != null) {
        if (await refreshToken(tokenModel)) {
          return handler.resolve(await _retry(err.requestOptions));
        }
      }
    }
    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<bool> refreshToken(TokenModel tokenModel) async {
    final response = await dio.post(AppLinks.refreshTokenLink, data: {
      "token": tokenModel.refreshToken,
      "expires": tokenModel.expires
    });
    if (response.statusCode == 200) {
      //token data
      tokenModel.accessToken = response.data["accessToken"];
      tokenModel.refreshToken = response.data["refreshToken"];
      tokenModel.expires = response.data["expires"];
      StoreToken.storeToken(tokenModel);
      //user
      StoreUser.setUser(UserModel.fromJson(response.data));

      return true;
    } else {
      return false;
    }
  }
}
