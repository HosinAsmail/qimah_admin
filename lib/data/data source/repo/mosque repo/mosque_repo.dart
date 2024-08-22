import 'package:dartz/dartz.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/data/model/mosque%20models/mosque_model.dart';

abstract class MosqueRepo {
  Future<Either<Failure, void>> createMosque(MosqueModel mosqueModel);
}
