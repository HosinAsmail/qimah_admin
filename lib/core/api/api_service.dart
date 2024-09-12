import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:qimah_admin/core/device/device_utility.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/core/helper/functions/init_get_it.dart';

import 'api_consumer.dart';
import 'app_interceptors.dart';

class ApiService extends ApiConsumer {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        HttpClient client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

    dio.options
      // ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.json
      ..followRedirects = false;
    dio.interceptors.add(getIt.get<AppInterceptors>());
    if (kDebugMode) {
      dio.interceptors.add(getIt.get<LogInterceptor>());
    }
  }
  @override
  Future<Either<Failure, dynamic>> get(
      {Map<String, dynamic>? queryParameters,
      required String url,
      Map<String, String>? headers}) async {
    try {
      if (await AppDevice.checkInternetFunction()) {
        final response = await dio.get(
          url,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ),
        );
        return right(response.data);
      } else {
        throw const SocketException("");
      }
    } catch (error) {
      return left(_handleError(error));
    }
  }

  @override
  Future<Either<Failure, dynamic>> post(
      {required String url,
      Object? body,
      bool formDataIsEnabled = false,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    try {
      if (await AppDevice.checkInternetFunction()) {
        final response = await dio.post(url,
            data: formDataIsEnabled
                ? FormData.fromMap(body as Map<String, dynamic>)
                : body,
            options: Options(
              headers: headers,
            ),
            queryParameters: queryParameters);

        return right(response.data);
      } else {
        throw const SocketException("");
      }
    } catch (error) {
      return left(_handleError(error));
    }
  }

  @override
  Future<Either<Failure, dynamic>> delete(
      {Object? body,
      required String url,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    try {
      if (await AppDevice.checkInternetFunction()) {
        final response = await dio.delete(url,
            data: body,
            options: Options(
              headers: headers,
            ),
            queryParameters: queryParameters);
        return right(response.data);
      } else {
        throw const SocketException("");
      }
    } catch (error) {
      return left(_handleError(error));
    }
  }

  @override
  Future<Either<Failure, dynamic>> put(
      {Object? body,
      required String url,
      Map<String, String>? headers,
      bool responseIsParsing = true,
      Map<String, dynamic>? queryParameters}) async {
    try {
      if (await AppDevice.checkInternetFunction()) {
        final response = await dio.put(
          url,
          data: body,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ),
        );
        return right(response.data);
      } else {
        throw const SocketException("");
      }
    } catch (error) {
      return left(_handleError(error));
    }
  }

  ServerFailure _handleError(e) {
    if (e is HandshakeException || e is SocketException) {
      return ServerFailure("the internet is slow try again");
    }
    if (e is DioException) {
      return ServerFailure.fromDioError(e);
    }
    return ServerFailure(
      e.toString(),
    );
  }
}
