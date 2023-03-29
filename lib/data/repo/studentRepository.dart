import 'package:online_exam_test/data/source/studentDataSource.dart';
import 'package:online_exam_test/data/student.dart';

abstract class IStudentRepository {
  Future<List<StudentEntity>> getAll();
  Future<void> createNewStudent(
      String name, String lastName, String studentCode, String phoneNumber);
  Future<void> deleteStudentByStudentCode(String studentCode);
}

class StudentRepository implements IStudentRepository {
  final IStudentDataSource dataSource;

  StudentRepository(this.dataSource);

  @override
  Future<void> createNewStudent(String name, String lastName,
      String studentCode, String phoneNumber) async {
    dataSource.createNewStudent(name, lastName, studentCode, phoneNumber);
  }

  @override
  Future<void> deleteStudentByStudentCode(String studentCode) async {
    dataSource.deleteStudentByStudentCode(studentCode);
  }

  @override
  Future<List<StudentEntity>> getAll() async {
    return dataSource.getAll();
  }
}
