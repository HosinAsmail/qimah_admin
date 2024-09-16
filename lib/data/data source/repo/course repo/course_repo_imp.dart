import 'package:dartz/dartz.dart';
import 'package:qimah_admin/core/api/api_service.dart';
import 'package:qimah_admin/core/constant/app_links.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/data/data%20source/repo/course%20repo/course_repo.dart';
import 'package:qimah_admin/data/model/course%20models/course_model.dart';

class CourseRepoImpl implements CourseRepo {
  ApiService apiService;
  CourseRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> addCourse(CourseModel courseModel) async {
    var result = await apiService.post(
        url: AppLinks.addCoursesLink, body: courseModel.toJson());
    return result.fold((failure) {
      return left(failure);
    }, (response) {
      return right(null);
    });
  }

  @override
  Future<Either<Failure, void>> editCourse(CourseModel courseInputModel) async {
    var result = await apiService.put(
        url: AppLinks.editCoursesLink, body: courseInputModel.toJson());
    return result.fold((failure) {
      return left(failure);
    }, (response) {
      return right(null);
    });
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getCourses(int mosqueId) async {
    var result =
        await apiService.get(url: "${AppLinks.getCoursesLink}$mosqueId");
    return result.fold((failure) {
      return left(failure);
    }, (response) {
      List<CourseModel> courses = [];
      for (final course in response) {
        courses.add(CourseModel.fromJson(course));
      }
      return right(courses);
    });
  }

  @override
  Future<Either<Failure, void>> deleteCourse(int courseId) async {
    var result =
        await apiService.delete(url: "${AppLinks.deleteCoursesLink}$courseId");
    return result.fold((failure) {
      return left(failure);
    }, (response) {
      return right(null);
    });
  }
}
