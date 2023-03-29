part of 'add_student_bloc.dart';

abstract class AddStudentState extends Equatable {
  const AddStudentState();

  @override
  List<Object> get props => [];
}

class AddStudentInitial extends AddStudentState {}

class AddStudentsuccess extends AddStudentState {}

class AddStudentError extends AddStudentState {
  final AppException exception;

  const AddStudentError({required this.exception});
}
