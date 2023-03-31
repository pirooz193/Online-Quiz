import 'package:online_exam_test/data/answer.dart';

class QuestionEntity {
  final String title;
  final String score;
  final AnswerEntity correctAnswer;
  final List<AnswerEntity> answers;

  QuestionEntity.fromJson(Map<String, dynamic> json)
      : title = json['question_title'],
        score = json['question_score'],
        correctAnswer = AnswerEntity.fromJson(json['correct_answer']),
        answers = json['answers'];
}
