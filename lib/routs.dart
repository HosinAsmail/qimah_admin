import 'package:qimah_admin/core/middleware/my_middleware.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/view/screens/sign_up_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const SignUpScreen(),
      middlewares: [MyMiddleWare()]),
  
];
