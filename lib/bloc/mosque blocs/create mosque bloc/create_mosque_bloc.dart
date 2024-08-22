import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/core/extension/string_extensions.dart';
import 'package:qimah_admin/data/data%20source/repo/mosque%20repo/mosque_repo_imp.dart';
import 'package:qimah_admin/data/model/mosque%20models/mosque_model.dart';
import 'package:qimah_admin/data/model/user_model.dart';
part 'create_mosque_event.dart';
part 'create_mosque_state.dart';

/// A bloc that manages the state of a CreateMosque according to the event that is dispatched to it.
class CreateMosqueBloc extends Bloc<CreateMosqueEvent, CreateMosqueState> {
  MosqueRepoImpl mosqueRepo;

  TextEditingController mosqueNameController = TextEditingController();

  TextEditingController courseNameController = TextEditingController();

  TextEditingController zoneController = TextEditingController();

  TextEditingController courseGenderController = TextEditingController();

  CreateMosqueBloc(this.mosqueRepo) : super(CreateMosqueInitial()) {
    on<CreateMosqueInitialEvent>(_onInitialize);
    on<CreateMosquePressedEvent>(_onPressed);
  }

  _onPressed(
    CreateMosquePressedEvent event,
    Emitter<CreateMosqueState> emit,
  ) async {
    emit(CreateMosqueLoading());

    MosqueModel mosqueModel = MosqueModel(
        createdAt: DateTime.now(),
        lastUpdatedAt: DateTime.now(),
        name: mosqueNameController.text,
        zone: zoneController.text,
        courseName: courseNameController.text,
        createdBy: UserModel.instance.id,
        courseGender: courseGenderController.text.toInt());
    var result = await mosqueRepo.createMosque(mosqueModel);
    result.fold((failure) {
      emit(CreateMosqueFailure(failure.errMessage));
    }, (_) {
      emit(const CreateMosqueSuccess());
    });
  }

  _onInitialize(
    CreateMosqueInitialEvent event,
    Emitter<CreateMosqueState> emit,
  ) async {
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordConfirmController = TextEditingController();
  }
}
