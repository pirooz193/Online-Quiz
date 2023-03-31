class AnswerEntity {
  final int id;
  final String content;

  AnswerEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['content'];
}
