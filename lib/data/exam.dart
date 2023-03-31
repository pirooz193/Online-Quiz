import 'question.dart';

class ExamEntity {
  final String examTitle;
  final double examScore;
  final String startDateTime;
  final String endDateTime;
  final List<QuestionEntity> questions;

  ExamEntity.fromJson(Map<String, dynamic> json)
      : examTitle = json['exam_title'],
        examScore = json['exam_score'],
        startDateTime = json['start_date_time'],
        endDateTime = json['end_date_time'],
        questions = json['questions'];
}
