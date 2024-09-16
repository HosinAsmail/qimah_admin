import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/core/extension/string_extensions.dart';
import 'package:qimah_admin/data/data%20source/locale/store_mosque.dart';
import 'package:qimah_admin/data/data%20source/repo/course%20repo/course_repo_imp.dart';
import 'package:qimah_admin/data/model/course%20models/course_model.dart';

part 'edit_course_event.dart';
part 'edit_course_state.dart';

/// A bloc that manages the state of a EditCourse according to the event that is dispatched to it.
class EditCourseBloc extends Bloc<EditCourseEvent, EditCourseState> {
  CourseRepoImpl courseRepoImpl;
  TextEditingController courseNameController = TextEditingController();

  TextEditingController courseGenderController = TextEditingController();

  EditCourseBloc(this.courseRepoImpl) : super(EditCourseInitial()) {
    on<EditCourseInitialEvent>(_onInitialize);
    on<EditCoursePressedEvent>(_onPressed);
  }

  _onPressed(
    EditCoursePressedEvent event,
    Emitter<EditCourseState> emit,
  ) async {
    emit(EditCourseLoading());

    CourseModel courseModel = CourseModel(
        id: event.courseId,
        createdAt: DateTime.now(),
        lastUpdatedAt: DateTime.now(),
        name: courseNameController.text,
        mosqueId: StoreMosque.getMosque()!.id,
        gender: courseGenderController.text.toInt());
    var result = await courseRepoImpl.editCourse(courseModel);
    result.fold((failure) {
      emit(EditCourseFailure(failure.errMessage));
    }, (_) {
      emit(const EditCourseSuccess());
    });
  }

  _onInitialize(
    EditCourseInitialEvent event,
    Emitter<EditCourseState> emit,
  ) async {
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordConfirmController = TextEditingController();
  }
}
