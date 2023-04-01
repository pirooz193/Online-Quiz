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
      String phoneNumber) async {
    final response = await httpClient.post('admin/create-master', data: {
      "name": name,
      "lastName": lastName,
      "master_code": teacherCode,
      "phone_number": phoneNumber
    });
    validateResponse(response);
  }

  @override
  Future<void> deleteTeacherByCode(String teacherCode) async {
    final response =
        await httpClient.delete('/admin/delete-master/$teacherCode');
    validateResponse(response);
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
