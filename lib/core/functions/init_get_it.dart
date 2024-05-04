import 'package:dio/dio.dart';
import 'package:qimah_admin/core/api/api_service.dart';
import 'package:qimah_admin/data/data%20source/locale/store_step_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerSingleton<StoreStepService>(StoreStepService());
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  // getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
  // getIt.get<ApiService>(),
  // ));
}
