class StudentEntity {
  final int id;
  final String name;
  final String lastName;
  final String studentCode;
  final String phoneNumber;

  StudentEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        lastName = json['lastName'],
        studentCode = json['studentCode'],
        phoneNumber = json['phoneNumber'];
}
