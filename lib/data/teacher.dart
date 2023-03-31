class TeacherEntity {
  final int id;
  final String name;
  final String lastName;
  final String teacherCode;
  final String phoneNumber;

  TeacherEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        lastName = json['lastName'],
        teacherCode = json['masterCode'],
        phoneNumber = json['phoneNumber'];
}
