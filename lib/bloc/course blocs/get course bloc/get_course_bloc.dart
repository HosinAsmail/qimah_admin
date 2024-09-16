import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/data/data%20source/repo/course%20repo/course_repo_imp.dart';
import 'package:qimah_admin/data/model/course%20models/course_model.dart';

part 'get_course_event.dart';
part 'get_course_state.dart';

/// A bloc that manages the state of a GetCourse according to the event that is dispatched to it.
class GetCourseBloc extends Bloc<GetCourseEvent, GetCourseState> {
  CourseRepoImpl courseRepoImpl;

  GetCourseBloc(this.courseRepoImpl) : super(GetCourseInitial()) {
    on<GetCourseInitialEvent>(_onInitialize);
    on<GetCoursePressedEvent>(_onPressed);
  }

  _onPressed(
    GetCoursePressedEvent event,
    Emitter<GetCourseState> emit,
  ) async {
    emit(GetCourseLoading());

    var result = await courseRepoImpl.getCourses(event.mosqueId);
    result.fold((failure) {
      emit(GetCourseFailure(failure.errMessage));
    }, (courses) {
      emit(GetCourseSuccess(courses: courses));
    });
  }

  _onInitialize(
    GetCourseInitialEvent event,
    Emitter<GetCourseState> emit,
  ) async {
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordConfirmController = TextEditingController();
  }
}
