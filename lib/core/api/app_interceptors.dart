import 'dart:io';
import 'package:qimah_admin/core/helper/functions/init_get_it.dart';
import 'package:dio/dio.dart';
import 'package:qimah_admin/core/constant/app_links.dart';
import 'package:qimah_admin/data.dart';
import 'package:qimah_admin/data/data%20source/locale/store_token.dart';
import 'package:qimah_admin/data/model/auth%20models/token_model.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;
  AppInterceptors({
    required this.dio,
  });
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.acceptHeader] = ContentType.json;
    getIt.get<TokenModel>().accessToken;
    if (getIt.get<TokenModel>().accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] =
          "Bearer ${getIt.get<TokenModel>().accessToken}";
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
    if (err.response?.statusCode == 401 &&
        (err.response!.data["message"] as String).contains("Expired token")) {
      if (getIt.get<TokenModel>().accessToken != null &&
          getIt.get<TokenModel>().refreshToken != null) {
        if (await refreshToken(getIt.get<TokenModel>())) {
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
      "refresh_token": tokenModel.refreshToken,
      // "expires": tokenModel.expires
    },);
    if (response.statusCode == 200) {
      //token data
      tokenModel.accessToken = response.data["data"]["access_token"];
      tokenModel.refreshToken = response.data["data"]["refresh_token"];
      // tokenModel.expires = response.data["expires"];
      // logger.w(tokenModel.toString());
      await StoreToken.storeToken(tokenModel);
      await StoreToken.initTokenVariable();
      return true;
    } else {
      return false;
    }
  }
}
