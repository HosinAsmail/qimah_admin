import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/bloc/sign%20up%20bloc/sign_up_bloc.dart';
import 'package:qimah_admin/core/helper/functions/init_get_it.dart';
import 'package:qimah_admin/core/middleware/my_middleware.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/data/data%20source/repo/auth%20repo/auth_repo_imp.dart';
import 'package:qimah_admin/view/screens/sign_up_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(getIt.get<AuthRepoImpl>())
              ..add(SignUpInitialEvent()),
            child: const SignUpScreen(),
          ),
      middlewares: [MyMiddleWare()]),
];
