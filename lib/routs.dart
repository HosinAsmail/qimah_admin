import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import "package:get/get_navigation/src/routes/transitions_type.dart"
    as transition;
import 'package:qimah_admin/bloc/auth%20blocs/login%20bloc/login_bloc.dart';
import 'package:qimah_admin/bloc/auth%20blocs/sign%20up%20bloc/sign_up_bloc.dart';
import 'package:qimah_admin/bloc/course%20blocs/add%20course%20bloc/add_course_bloc.dart';
import 'package:qimah_admin/bloc/course%20blocs/delete%20course%20bloc/delete_course_bloc.dart';
import 'package:qimah_admin/bloc/course%20blocs/edit%20course%20bloc/edit_course_bloc.dart';
import 'package:qimah_admin/bloc/course%20blocs/get%20course%20bloc/get_course_bloc.dart';
import 'package:qimah_admin/bloc/group%20blocs/add%20group%20bloc/add_group_bloc.dart';
import 'package:qimah_admin/bloc/group%20blocs/delete%20group%20bloc/delete_group_bloc.dart';
import 'package:qimah_admin/bloc/group%20blocs/edit%20group%20bloc/edit_group_bloc.dart';
import 'package:qimah_admin/bloc/group%20blocs/get%20group%20bloc/get_group_bloc.dart';
import 'package:qimah_admin/bloc/mosque%20blocs/create%20mosque%20bloc/create_mosque_bloc.dart';
import 'package:qimah_admin/core/constant/app_routes.dart';
import 'package:qimah_admin/core/helper/functions/init_get_it.dart';
import 'package:qimah_admin/core/middleware/my_middleware.dart';
import 'package:qimah_admin/data/data%20source/repo/auth%20repo/auth_repo_imp.dart';
import 'package:qimah_admin/data/data%20source/repo/course%20repo/course_repo_imp.dart';
import 'package:qimah_admin/data/data%20source/repo/group%20repo/group_repo_imp.dart';
import 'package:qimah_admin/data/data%20source/repo/mosque%20repo/mosque_repo_imp.dart';
import 'package:qimah_admin/view/screens/base/Adds/add_bosses_screen.dart';
import 'package:qimah_admin/view/screens/base/Adds/add_courses_screen.dart';
import 'package:qimah_admin/view/screens/base/Adds/add_groups_screen.dart';
import 'package:qimah_admin/view/screens/base/Adds/add_students_screen.dart';
import 'package:qimah_admin/view/screens/base/Profile/bosses_screen.dart';
import 'package:qimah_admin/view/screens/base/Profile/courses_screen.dart';
import 'package:qimah_admin/view/screens/base/Profile/groups_screen.dart';
import 'package:qimah_admin/view/screens/base/Profile/personal_screen.dart';
import 'package:qimah_admin/view/screens/base/Profile/students_screen.dart';
import 'package:qimah_admin/view/screens/base/base_screen.dart';
import 'package:qimah_admin/view/screens/create_mosque_screen.dart';
import 'package:qimah_admin/view/screens/login_screen.dart';
import 'package:qimah_admin/view/screens/sign_up_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => BlocProvider(
            create: (context) => LoginBloc(getIt.get<AuthRepoImpl>()),
            child: const BaseScreen(),
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
  GetPage(
      name: AppRoute.createMosqueScreen,
      page: () => BlocProvider<CreateMosqueBloc>(
            create: (context) => CreateMosqueBloc(getIt.get<MosqueRepoImpl>())
              ..add(CreateMosqueInitialEvent()),
            child: const CreateMosqueScreen(),
          ),
      transition: transition.Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.personalScreen,
      page: () => const PersonalScreen(),
      transition: transition.Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.baseScreen,
      page: () => const BaseScreen(),
      transition: transition.Transition.zoom,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.bossesScreen,
      page: () => BossesScreen(),
      transition: transition.Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.groupsScreen,
      page: () => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetGroupBloc(getIt.get<GroupRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    DeleteGroupBloc(getIt.get<GroupRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => EditGroupBloc(getIt.get<GroupRepoImpl>()),
              ),
            ],
            child: GroupsScreen(),
          ),
      transition: transition.Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.studentsScreen,
      page: () => StudentsScreen(),
      transition: transition.Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.coursesScreen,
      page: () => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetCourseBloc(getIt.get<CourseRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    DeleteCourseBloc(getIt.get<CourseRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    EditCourseBloc(getIt.get<CourseRepoImpl>()),
              ),
            ],
            child: const CoursesScreen(),
          ),
      transition: transition.Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.addStudentsScreen,
      page: () => const AddStudentsScreen(),
      transition: transition.Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.addGroupsScreen,
      page: () => BlocProvider(
            create: (context) => AddGroupBloc(getIt.get<GroupRepoImpl>()),
            child: const AddGroupsScreen(),
          ),
      transition: transition.Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.addCoursesScreen,
      page: () => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AddCourseBloc(getIt.get<CourseRepoImpl>()),
              ),
            ],
            child: const AddCoursesScreen(),
          ),
      transition: transition.Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoute.addBossesScreen,
      page: () => const AddBossesScreen(),
      transition: transition.Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 400)),
];
