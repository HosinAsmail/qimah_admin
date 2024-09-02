import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/bloc/login%20bloc/login_bloc.dart';
import 'package:qimah_admin/bloc/sign%20up%20bloc/sign_up_bloc.dart';
import 'package:qimah_admin/core/constant/app_routes.dart';
import 'package:qimah_admin/core/helper/functions/init_get_it.dart';
import 'package:qimah_admin/core/middleware/my_middleware.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/data/data%20source/repo/auth%20repo/auth_repo_imp.dart';
import 'package:qimah_admin/view/screens/base/base_screen.dart';
import 'package:qimah_admin/view/screens/login_screen.dart';
import 'package:qimah_admin/view/screens/sign_up_screen.dart';
import "package:get/get_navigation/src/routes/transitions_type.dart"
    as transition;

import 'view/screens/base/personal_screen.dart';

List<GetPage<dynamic>>? routes = [

  GetPage(
      name: "/",
      page:  () => BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(getIt.get<AuthRepoImpl>())
              ..add(SignUpInitialEvent()),
            child: const SignUpScreen(),
          ),
      middlewares: [MyMiddleWare()]),
  GetPage(
      name: AppRoute.loginScreen,
      page: () => BlocProvider(
            create: (context) => LoginBloc(getIt.get<AuthRepoImpl>()),
            child: const LoginScreen(),
          ),
      transition: transition.Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.signUpScreen,
      page: () => BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(getIt.get<AuthRepoImpl>())
              ..add(SignUpInitialEvent()),
            child: const SignUpScreen(),
          ),
      transition: transition.Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400)),

];
