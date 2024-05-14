import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qimah_admin/core/api/api_service.dart';
import 'package:qimah_admin/core/constant/app_links.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/data.dart';
import 'package:qimah_admin/data/data%20source/repo/auth%20repo/auth_repo.dart';
import 'package:qimah_admin/data/model/sign_up_model.dart';

class AuthRepoImpl implements AuthRepo {
  ApiService apiService;
  AuthRepoImpl(this.apiService);
  // @override
  // Future<Either<Failure, UserModel>> login(
  //     String username, String password) async {
  //   try {
  //     var response = await apiService.post(
  //         url: AppLinks.loginLink,
  //         data: {"username": username, "password": password});

  //     return right(UserModel.fromJson(response["data"][0]));
  //   } catch (e) {
  //     print(e);
  //     if (e is HandshakeException) {
  //       return left(
  //         ServerFailure("the internet is slow try again"),
  //       );
  //     }
  //     if (e is DioException) {
  //       return left(
  //         ServerFailure.fromDioError(e),
  //       );
  //     }
  //     return left(
  //       ServerFailure(
  //         e.toString(),
  //       ),
  //     );
  //   }
  // }

  @override
  Future<Either<Failure, String>> signUp(SignUpModel signUpModel) async {
    try {
      var response = await apiService.postMore(
          url: AppLinks.signUpLink, data: signUpModel.toJson());
      logger.i(response);
      return right("");
    } catch (e) {
      print(e);
      if (e is HandshakeException) {
        return left(
          ServerFailure("the internet is slow try again"),
        );
      }
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
