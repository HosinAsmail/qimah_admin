import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/bloc/sign%20up%20bloc/sign_up_bloc.dart';
import 'package:qimah_admin/core/middleware/my_middleware.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/data/model/sign_up_model.dart';
import 'package:qimah_admin/view/screens/sign_up_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(SignUpState(
              signUpModel: const SignUpModel(),
            ))
              ..add(SignUpInitialEvent()),
            child: const SignUpScreen(),
          ),
      middlewares: [MyMiddleWare()]),
];
