import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:qimah_admin/core/api/api_service.dart';
import 'package:qimah_admin/core/api/app_interceptors.dart';
import 'package:qimah_admin/data/data%20source/repo/auth%20repo/auth_repo_imp.dart';
import 'package:qimah_admin/data/data%20source/repo/course%20repo/course_repo_imp.dart';
import 'package:qimah_admin/data/data%20source/repo/group%20repo/group_repo_imp.dart';
import 'package:qimah_admin/data/data%20source/repo/mosque%20repo/mosque_repo_imp.dart';
import 'package:qimah_admin/data/model/auth%20models/token_model.dart';

final getIt = GetIt.instance;
void initGetIt() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));

  getIt.registerSingleton<TokenModel>(TokenModel());
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  getIt.registerSingleton(AppInterceptors(
    dio: getIt.get<Dio>(),
  ));
  getIt.registerSingleton<ApiService>(ApiService(dio: getIt.get<Dio>()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<MosqueRepoImpl>(
      MosqueRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<CourseRepoImpl>(CourseRepoImpl(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<GroupRepoImpl>(GroupRepoImpl(
    getIt.get<ApiService>(),
  ));
}
