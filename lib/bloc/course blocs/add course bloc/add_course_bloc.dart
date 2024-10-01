import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/core/extension/string_extensions.dart';
import 'package:qimah_admin/data/data%20source/locale/store_mosque.dart';
import 'package:qimah_admin/data/data%20source/repo/course%20repo/course_repo_imp.dart';
import 'package:qimah_admin/data/model/course%20models/course_model.dart';

part 'add_course_event.dart';
part 'add_course_state.dart';

/// A bloc that manages the state of a AddCourse according to the event that is dispatched to it.
class AddCourseBloc extends Bloc<AddCourseEvent, AddCourseState> {
  CourseRepoImpl courseRepoImpl;
  TextEditingController courseNameController = TextEditingController();

  TextEditingController courseGenderController = TextEditingController();

  AddCourseBloc(this.courseRepoImpl) : super(AddCourseInitial()) {
    on<AddCourseInitialEvent>(_onInitialize);
    on<AddCoursePressedEvent>(_onPressed);
  }

  _onPressed(
    AddCoursePressedEvent event,
    Emitter<AddCourseState> emit,
  ) async {
    emit(AddCourseLoading());

    CourseModel courseModel = CourseModel(
        createdAt: DateTime.now(),
        lastUpdatedAt: DateTime.now(),
        name: courseNameController.text,
        mosqueId: StoreMosque.getMosque()!.id,
        gender: courseGenderController.text.toInt());
    var result = await courseRepoImpl.addCourse(courseModel);
    result.fold((failure) {
      emit(AddCourseFailure(failure.errMessage));
    }, (_) {
      emit(const AddCourseSuccess());
    });
  }

  _onInitialize(
    AddCourseInitialEvent event,
    Emitter<AddCourseState> emit,
  ) async {
    courseGenderController.text = "0";
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordConfirmController = TextEditingController();
  }
}
