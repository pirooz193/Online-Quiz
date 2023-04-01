import 'package:dio/dio.dart';
import 'package:online_exam_test/data/common/http_response_validator.dart';
import 'package:online_exam_test/data/course.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAllCoursesDataSource {
  Future<List<CourseEntity>> getAll();
  Future<void> createNewCourse(
      String courseTitle, int capacity, String teacherCode);

  Future<void> deleteCourse(String courseCode);
}

class AllCoursesRemoteDataSource
    with HttpResponseValidator
    implements IAllCoursesDataSource {
  final Dio httpClient;

  AllCoursesRemoteDataSource(this.httpClient);

  @override
  Future<void> createNewCourse(
      String courseTitle, int capacity, String teacherCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('access_token');
    httpClient.options.headers["Authorization"] = "Bearer $token";
    final response = await httpClient.post('admin/create-course', data: {
      "course_title": courseTitle,
      "capacity": capacity,
      "teacher_code": teacherCode
    });
    validateResponse(response);
  }

  @override
  Future<void> deleteCourse(String courseCode) async {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }

  @override
  Future<List<CourseEntity>> getAll() async {
    final response = await httpClient.get('admin/all-courses');
    final List<CourseEntity> courses = [];
    (response.data as List).forEach((course) {
      courses.add(CourseEntity.fromJson(course));
    });
    validateResponse(response);
    return courses;
  }
}
