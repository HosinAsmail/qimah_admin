import 'package:dartz/dartz.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/data/model/auth%20models/login_model.dart';
import 'package:qimah_admin/data/model/auth%20models/sign_up_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> login(LoginModel loginModel);
  Future<Either<Failure, String>> signUp(SignUpModel signUpModel);
  
}
