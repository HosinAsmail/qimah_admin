import 'package:dartz/dartz.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/data/model/Group%20models/Group_model.dart';

abstract class GroupRepo {
  Future<Either<Failure, void>> addGroup(GroupModel GroupModel);
  Future<Either<Failure, List<GroupModel>>> getGroups(int mosqueId);
  Future<Either<Failure, void>> deleteGroup(int GroupId);
  Future<Either<Failure, void>> editGroup(GroupModel GroupInputModel);
}
