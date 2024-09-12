import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/core/constant/app_routes.dart';
import 'package:qimah_admin/data/data%20source/locale/store_step.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    String? step = StoreStep.getStep();
    if (step == '1') {
      return const RouteSettings(name: AppRoute.createMosqueScreen);
    } else if (step == '2') {
      return const RouteSettings(name: AppRoute.baseScreen);
    } else {
      return null;
    }
  }
}
