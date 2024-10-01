import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/data/data%20source/locale/store_mosque.dart';
import 'package:qimah_admin/data/data%20source/repo/group%20repo/group_repo_imp.dart';
import 'package:qimah_admin/data/model/Group%20models/Group_model.dart';

part 'get_group_event.dart';
part 'get_group_state.dart';

/// A bloc that manages the state of a GetGroup according to the event that is dispatched to it.
class GetGroupBloc extends Bloc<GetGroupEvent, GetGroupState> {
  GroupRepoImpl groupRepoImpl;

  GetGroupBloc(this.groupRepoImpl) : super(GetGroupInitial()) {
    on<GetGroupInitialEvent>(_onInitialize);
    on<GetGroupPressedEvent>(_onPressed);
  }

  _onPressed(
    GetGroupPressedEvent event,
    Emitter<GetGroupState> emit,
  ) async {
    emit(GetGroupLoading());
    int mosqueId = StoreMosque.getMosque()!.id!;
    var result = await groupRepoImpl.getGroups(mosqueId);
    result.fold((failure) {
      emit(GetGroupFailure(failure.errMessage));
    }, (groups) {
      emit(GetGroupSuccess(groups: groups));
    });
  }

  _onInitialize(
    GetGroupInitialEvent event,
    Emitter<GetGroupState> emit,
  ) async {
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordConfirmController = TextEditingController();
  }
}
