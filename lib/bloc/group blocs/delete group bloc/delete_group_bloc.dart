import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/data/data%20source/repo/group%20repo/group_repo_imp.dart';

part 'delete_group_event.dart';
part 'delete_group_state.dart';

/// A bloc that manages the state of a DeleteGroup according to the event that is dispatched to it.
class DeleteGroupBloc extends Bloc<DeleteGroupEvent, DeleteGroupState> {
  GroupRepoImpl groupRepoImpl;

  DeleteGroupBloc(this.groupRepoImpl) : super(DeleteGroupInitial()) {
    on<DeleteGroupInitialEvent>(_onInitialize);
    on<DeleteGroupPressedEvent>(_onPressed);
  }

  _onPressed(
    DeleteGroupPressedEvent event,
    Emitter<DeleteGroupState> emit,
  ) async {
    emit(DeleteGroupLoading());

    var result = await groupRepoImpl.deleteGroup(event.mosqueId);
    result.fold((failure) {
      emit(DeleteGroupFailure(failure.errMessage));
    }, (_) {
      emit(DeleteGroupSuccess());
    });
  }

  _onInitialize(
    DeleteGroupInitialEvent event,
    Emitter<DeleteGroupState> emit,
  ) async {
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordConfirmController = TextEditingController();
  }
}
