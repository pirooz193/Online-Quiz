import 'package:dio/dio.dart';
import 'package:online_exam_test/common/http_client.dart';
import 'package:online_exam_test/data/common/http_response_validator.dart';
import 'package:online_exam_test/data/repo/studentRepository.dart';
import 'package:online_exam_test/data/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

final studentRepository =
    StudentRepository(StudentRemoteDataSource(httpClient));

abstract class IStudentDataSource {
  Future<List<StudentEntity>> getAll();
  Future<void> createNewStudent(
      String name, String lastName, String studentCode, String phoneNumber);
  Future<void> deleteStudentByStudentCode(String studentCode);
}

class StudentRemoteDataSource
    with HttpResponseValidator
    implements IStudentDataSource {
  final Dio httpClient;

  StudentRemoteDataSource(this.httpClient);

  @override
  Future<void> createNewStudent(String name, String lastName,
      String studentCode, String phoneNumber) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String token = await sharedPreferences.getString("access_token")!;
    httpClient.options.headers["Authorization"] = "Bearer $token";
    final response = await httpClient.post("admin/create-student", data: {
      "name": name,
      "lastName": lastName,
      "studentCode": studentCode,
      "phone_number": phoneNumber
    });
    validateResponse(response);
    // return StudentEntity.fromJson(response.data);
  }

  @override
  Future<void> deleteStudentByStudentCode(String studentCode) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String token = await sharedPreferences.getString("access_token")!;
    httpClient.options.headers["Authorization"] = "Bearer $token";
    final response =
        await httpClient.delete("admin/delete-student/$studentCode");
    validateResponse(response);
  }

  @override
  Future<List<StudentEntity>> getAll() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String token = await sharedPreferences.getString("access_token")!;
    httpClient.options.headers["Authorization"] = "Bearer $token";
    final response = await httpClient.get("admin/get-all-students");
    validateResponse(response);
    List<StudentEntity> students = [];
    (response.data as List).forEach((element) {
      students.add(StudentEntity.fromJson(element));
    });

    return students;
  }
}
