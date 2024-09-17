import 'package:dartz/dartz.dart';
import 'package:qimah_admin/core/errors/failures.dart';
import 'package:qimah_admin/data/model/course%20models/course_model.dart';

abstract class CourseRepo {
  Future<Either<Failure, void>> addCourse(CourseModel courseModel);
  Future<Either<Failure, List<CourseModel>>> getCourses(int mosqueId);
  Future<Either<Failure, void>> deleteCourse(int courseId);
  Future<Either<Failure, void>> editCourse(CourseModel courseInputModel);
}
