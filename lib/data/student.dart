class StudentEntity {
  final int id;
  final String username;
  final String password;
  final String studentCode;
  final String phoneNumber;

  StudentEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        password = json['password'],
        studentCode = json['studentCode'],
        phoneNumber = json['phoneNumber'];
}
