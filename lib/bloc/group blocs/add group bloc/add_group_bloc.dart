import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/data/data%20source/repo/group%20repo/group_repo_imp.dart';
import 'package:qimah_admin/data/model/Group%20models/Group_model.dart';

part 'add_group_event.dart';
part 'add_group_state.dart';

/// A bloc that manages the state of a AddGroup according to the event that is dispatched to it.
class AddGroupBloc extends Bloc<AddGroupEvent, AddGroupState> {
  GroupRepoImpl groupRepoImpl;
  TextEditingController groupNameController = TextEditingController();

  TextEditingController groupDescController = TextEditingController();

  AddGroupBloc(this.groupRepoImpl) : super(AddGroupInitial()) {
    on<AddGroupInitialEvent>(_onInitialize);
    on<AddGroupPressedEvent>(_onPressed);
  }

  _onPressed(
    AddGroupPressedEvent event,
    Emitter<AddGroupState> emit,
  ) async {
    emit(AddGroupLoading());

    GroupModel groupModel = GroupModel(
        name: groupNameController.text,
        description: groupDescController.text,
        courseId: 0); //! fix this
    var result = await groupRepoImpl.addGroup(groupModel);
    result.fold((failure) {
      emit(AddGroupFailure(failure.errMessage));
    }, (_) {
      emit(AddGroupSuccess());
    });
  }

  _onInitialize(
    AddGroupInitialEvent event,
    Emitter<AddGroupState> emit,
  ) async {
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordConfirmController = TextEditingController();
  }
}
