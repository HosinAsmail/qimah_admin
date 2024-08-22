import 'package:dartz/dartz.dart';
import 'package:qimah_admin/core/api/api_service.dart';
import 'package:qimah_admin/core/constant/app_links.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/data/data%20source/repo/mosque%20repo/mosque_repo.dart';
import 'package:qimah_admin/data/model/mosque%20models/mosque_model.dart';

class MosqueRepoImpl implements MosqueRepo {
  ApiService apiService;
  MosqueRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> createMosque(MosqueModel mosqueModel) async {
    var result = await apiService.post(
        url: AppLinks.mosqueLink, body: mosqueModel.toJson());
    return result.fold((failure) {
      return left(failure);
    }, (response) {
      // //user
      // StoreUser.setUser(UserModel.fromJson(response["data"]));
      // //token
      // getIt.get<TokenModel>().fromJson(response["data"]);
      // StoreToken.storeToken(getIt.get<TokenModel>());
      return right(null);
    });
  }
}
