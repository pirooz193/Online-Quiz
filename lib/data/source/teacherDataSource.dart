import 'package:dio/dio.dart';
import 'package:online_exam_test/data/common/http_response_validator.dart';
import 'package:online_exam_test/data/teacher.dart';

abstract class ITeacherDataSource {
  Future<List<TeacherEntity>> getAll();
  Future<void> addNewTeacher(
      String name, String lastName, String teacherCode, String phoneNumber);
  Future<void> deleteTeacherByCode(String teacherCode);
}

class TeacherRemoteDataSource
    with HttpResponseValidator
    implements ITeacherDataSource {
  final Dio httpClient;

  TeacherRemoteDataSource({required this.httpClient});

  @override
  Future<void> addNewTeacher(String name, String lastName, String teacherCode,
      String phoneNumber) async {}

  @override
  Future<void> deleteTeacherByCode(String teacherCode) {
    // TODO: implement deleteTeacherByCode
    throw UnimplementedError();
  }

  @override
  Future<List<TeacherEntity>> getAll() async {
    final response = await httpClient.get('/admin/all-teachers');
    validateResponse(response);
    List<TeacherEntity> teachers = [];
    (response.data as List).forEach((teacher) {
      teachers.add(TeacherEntity.fromJson(teacher));
    });
    return teachers;
  }
}
