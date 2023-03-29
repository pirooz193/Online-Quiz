part of 'add_student_bloc.dart';

abstract class AddStudentEvent extends Equatable {
  const AddStudentEvent();

  @override
  List<Object> get props => [];
}

class AddStudentStarted extends AddStudentEvent {}

class AddStudentButtonClicked extends AddStudentEvent {
  final String name;
  final String lastName;
  final String studentCode;
  final String phoneNumber;

  AddStudentButtonClicked(
      this.name, this.lastName, this.studentCode, this.phoneNumber);
}
