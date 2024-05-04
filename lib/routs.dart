import 'package:qimah_admin/core/middleware/my_middleware.dart';
import 'package:qimah_admin/view/screens/onboarding_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const OnBoardingScreen(),
      middlewares: [MyMiddleWare()]),
];
