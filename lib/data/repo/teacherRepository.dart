import 'package:online_exam_test/common/http_client.dart';
import 'package:online_exam_test/data/source/teacherDataSource.dart';
import 'package:online_exam_test/data/teacher.dart';

final teacherRepository =
    TeacherRepository(TeacherRemoteDataSource(httpClient: httpClient));

abstract class ITeacherRepository {
  Future<List<TeacherEntity>> getAll();
  Future<void> addNewTeacher(
      String name, String lastName, String teacherCode, String phoneNumber);
  Future<void> deleteTeacherByCode(String teacherCode);
}

class TeacherRepository implements ITeacherRepository {
  final TeacherRemoteDataSource dataSource;

  TeacherRepository(this.dataSource);

  @override
  Future<void> addNewTeacher(String name, String lastName, String teacherCode,
      String phoneNumber) async {
    dataSource.addNewTeacher(name, lastName, teacherCode, phoneNumber);
  }

  @override
  Future<void> deleteTeacherByCode(String teacherCode) async {
    dataSource.deleteTeacherByCode(teacherCode);
  }

  @override
  Future<List<TeacherEntity>> getAll() async {
    return dataSource.getAll();
  }
}
