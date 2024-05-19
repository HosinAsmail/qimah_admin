import 'package:dartz/dartz.dart';
import 'package:qimah_admin/core/api/api_service.dart';
import 'package:qimah_admin/core/constant/app_links.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/core/helper/functions/init_get_it.dart';
import 'package:qimah_admin/data/data%20source/locale/store_token.dart';
import 'package:qimah_admin/data/data%20source/locale/store_user.dart';
import 'package:qimah_admin/data/data%20source/repo/auth%20repo/auth_repo.dart';
import 'package:qimah_admin/data/model/auth%20models/login_model.dart';
import 'package:qimah_admin/data/model/auth%20models/sign_up_model.dart';
import 'package:qimah_admin/data/model/auth%20models/token_model.dart';
import 'package:qimah_admin/data/model/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  ApiService apiService;
  AuthRepoImpl(this.apiService);
  @override
  Future<Either<Failure, void>> login(LoginModel loginModel) async {
    var result = await apiService.post(
        url: AppLinks.loginLink, body: loginModel.toJson());
    result.fold((failure) {
      return left(failure);
    }, (response) {
      //user
      StoreUser.setUser(UserModel.fromJson(response));
      //token
      getIt.get<TokenModel>().fromJson(response);
      StoreToken.storeToken(TokenModel.fromJson(response));
      return right(null);
    });
    return right(null); // this code will no be executed at all
  }

  @override
  Future<Either<Failure, void>> signUp(SignUpModel signUpModel) async {
    var result = await apiService.post(
        url: AppLinks.signUpLink, body: signUpModel.toJson());
    result.fold((failure) {
      return left(failure);
    }, (response) {
      //user
      StoreUser.setUser(UserModel.fromJson(response));
      //token
      getIt.get<TokenModel>().fromJson(response);
      StoreToken.storeToken(TokenModel.fromJson(response));
      return right(null);
    });
    return right(null);
  }
}
