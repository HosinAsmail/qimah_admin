import 'package:dartz/dartz.dart';
import 'package:qimah_admin/core/api/api_service.dart';
import 'package:qimah_admin/core/constant/app_links.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/data/data%20source/repo/group%20repo/group_repo.dart';
import 'package:qimah_admin/data/model/Group%20models/Group_model.dart';

class GroupRepoImpl implements GroupRepo {
  ApiService apiService;
  GroupRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> addGroup(GroupModel groupModel) async {
    var result = await apiService.post(
        url: AppLinks.addGroupsLink, body: groupModel.toJson());
    return result.fold((failure) {
      return left(failure);
    }, (response) {
      return right(null);
    });
  }

  @override
  Future<Either<Failure, void>> editGroup(GroupModel groupInputModel) async {
    var result = await apiService.put(
        url: AppLinks.editGroupsLink, body: groupInputModel.toJson());
    return result.fold((failure) {
      return left(failure);
    }, (response) {
      return right(null);
    });
  }

  @override
  Future<Either<Failure, List<GroupModel>>> getGroups(int mosqueId) async {
    var result =
        await apiService.get(url: "${AppLinks.getGroupsLink}$mosqueId");
    return result.fold((failure) {
      return left(failure);
    }, (response) {
      List<GroupModel> groups = [];
      for (final group in response) {
        groups.add(GroupModel.fromJson(group));
      }
      return right(groups);
    });
  }

  @override
  Future<Either<Failure, void>> deleteGroup(int groupId) async {
    var result =
        await apiService.delete(url: "${AppLinks.deleteGroupsLink}$groupId");
    return result.fold((failure) {
      return left(failure);
    }, (response) {
      return right(null);
    });
  }
}
