import 'package:dartz/dartz.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/data/model/sign_up_model.dart';

abstract class AuthRepo {
  // Future<Either<Failure, UserModel>> login(String username, String password);
  Future<Either<Failure, String>> signUp(SignUpModel signUpModel);
  
}
