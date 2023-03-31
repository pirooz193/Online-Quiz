import 'package:online_exam_test/data/exam.dart';
import 'package:online_exam_test/data/student.dart';
import 'teacher.dart';

class CourseEntity {
  final String courseTitle;
  final String courseCode;
  final int capacity;
  final List<ExamEntity?> exam;
  final TeacherEntity? teacher;
  final List<StudentEntity?> students;

  CourseEntity.fromJson(Map<String, dynamic> json)
      : courseTitle = json['courseTitle'],
        courseCode = json['courseCode'],
        capacity = json['courseCapacity'],
        exam = (json['examList'] as List<dynamic>)
            .map((e) => ExamEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
        teacher = json['master'] != null
            ? TeacherEntity.fromJson(json['master'] as Map<String, dynamic>)
            : null,
        students = (json['students'] as List<dynamic>)
            .map((e) => StudentEntity.fromJson(e as Map<String, dynamic>))
            .toList();
}
