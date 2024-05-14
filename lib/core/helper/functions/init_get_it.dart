import 'package:dio/dio.dart';
import 'package:qimah_admin/core/api/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:qimah_admin/data/data%20source/repo/auth%20repo/auth_repo_imp.dart';

final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));

  // getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
  // getIt.get<ApiService>(),
  // ));
}
