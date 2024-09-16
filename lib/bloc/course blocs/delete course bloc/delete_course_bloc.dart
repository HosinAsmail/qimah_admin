import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/data/data%20source/repo/course%20repo/course_repo_imp.dart';

part 'delete_course_event.dart';
part 'delete_course_state.dart';

/// A bloc that manages the state of a DeleteCourse according to the event that is dispatched to it.
class DeleteCourseBloc extends Bloc<DeleteCourseEvent, DeleteCourseState> {
  CourseRepoImpl courseRepoImpl;

  DeleteCourseBloc(this.courseRepoImpl) : super(DeleteCourseInitial()) {
    on<DeleteCourseInitialEvent>(_onInitialize);
    on<DeleteCoursePressedEvent>(_onPressed);
  }

  _onPressed(
    DeleteCoursePressedEvent event,
    Emitter<DeleteCourseState> emit,
  ) async {
    emit(DeleteCourseLoading());

    var result = await courseRepoImpl.deleteCourse(event.mosqueId);
    result.fold((failure) {
      emit(DeleteCourseFailure(failure.errMessage));
    }, (courses) {
      emit(const DeleteCourseSuccess());
    });
  }

  _onInitialize(
    DeleteCourseInitialEvent event,
    Emitter<DeleteCourseState> emit,
  ) async {
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordConfirmController = TextEditingController();
  }
}
