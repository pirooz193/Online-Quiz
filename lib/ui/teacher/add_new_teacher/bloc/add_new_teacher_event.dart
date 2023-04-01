part of 'add_new_teacher_bloc.dart';

abstract class AddNewTeacherEvent extends Equatable {
  const AddNewTeacherEvent();

  @override
  List<Object> get props => [];
}

class AddTeacherStarted extends AddNewTeacherEvent {}

class AddSTeacherButtonClicked extends AddNewTeacherEvent {
  final String name;
  final String lastName;
  final String teacherCode;
  final String phoneNumber;

  AddSTeacherButtonClicked(
      this.name, this.lastName, this.teacherCode, this.phoneNumber);
}
