import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/data/data%20source/repo/group%20repo/group_repo_imp.dart';
import 'package:qimah_admin/data/model/Group%20models/Group_model.dart';

part 'edit_group_event.dart';
part 'edit_group_state.dart';

/// A bloc that manages the state of a EditGroup according to the event that is dispatched to it.
class EditGroupBloc extends Bloc<EditGroupEvent, EditGroupState> {
  GroupRepoImpl groupRepoImpl;
  TextEditingController groupNameController = TextEditingController();

  TextEditingController groupDescController = TextEditingController();

  EditGroupBloc(this.groupRepoImpl) : super(EditGroupInitial()) {
    on<EditGroupInitialEvent>(_onInitialize);
    on<EditGroupPressedEvent>(_onPressed);
  }

  _onPressed(
    EditGroupPressedEvent event,
    Emitter<EditGroupState> emit,
  ) async {
    emit(EditGroupLoading());

    GroupModel groupModel = GroupModel(
      id: event.groupId,
      name: groupNameController.text,
      description: groupDescController.text,
    );
    var result = await groupRepoImpl.editGroup(groupModel);
    result.fold((failure) {
      emit(EditGroupFailure(failure.errMessage));
    }, (_) {
      emit(EditGroupSuccess());
    });
  }

  _onInitialize(
    EditGroupInitialEvent event,
    Emitter<EditGroupState> emit,
  ) async {
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordConfirmController = TextEditingController();
  }
}
