import 'package:qimah_admin/core/constant/app_routes.dart';
import 'package:qimah_admin/core/functions/init_get_it.dart';
import 'package:qimah_admin/data/data%20source/locale/store_step_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    String? step = getIt.get<StoreStepService>().getStep();
    if (step == '1') {
      return const RouteSettings(name: AppRoute.homeScreen);
    } else {
      return null;
    }
  }
}
