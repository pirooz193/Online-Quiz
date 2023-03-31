import 'package:online_exam_test/common/http_client.dart';
import 'package:online_exam_test/data/course.dart';
import 'package:online_exam_test/data/source/courseDataSource.dart';

final courseRepository =
    CourseRepository(AllCoursesRemoteDataSource(httpClient));

abstract class ICourseRepository {
  Future<List<CourseEntity>> getAll();
  Future<void> createNewCourse(
      String courseTitle, int capacity, String teacherCode);

  Future<void> deleteCourse(String courseCode);
}

class CourseRepository implements ICourseRepository {
  final IAllCoursesDataSource dataSource;

  CourseRepository(this.dataSource);

  @override
  Future<void> createNewCourse(
      String courseTitle, int capacity, String teacherCode) async {
    await dataSource.createNewCourse(courseTitle, capacity, teacherCode);
  }

  @override
  Future<void> deleteCourse(String courseCode) async {
    await dataSource.deleteCourse(courseCode);
  }

  @override
  Future<List<CourseEntity>> getAll() async {
    return dataSource.getAll();
  }
}
