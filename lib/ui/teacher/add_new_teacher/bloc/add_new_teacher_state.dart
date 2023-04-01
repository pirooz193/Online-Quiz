part of 'add_new_teacher_bloc.dart';

abstract class AddNewTeacherState extends Equatable {
  const AddNewTeacherState();

  @override
  List<Object> get props => [];
}

class AddNewTeacherInitial extends AddNewTeacherState {}

class AddTeachersuccess extends AddNewTeacherState {}

class AddTeacherError extends AddNewTeacherState {
  final AppException exception;

  const AddTeacherError({required this.exception});
}
