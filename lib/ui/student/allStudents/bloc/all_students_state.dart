part of 'all_students_bloc.dart';

abstract class AllStudentsState extends Equatable {
  const AllStudentsState();

  @override
  List<Object> get props => [];
}

class StudentLoading extends AllStudentsState {}

// class AllStudentsInitial extends AllStudentsState {}

class StudentsSuccess extends AllStudentsState {
  final List<StudentEntity> students;

  const StudentsSuccess(this.students);
}

class AllStudentsError extends AllStudentsState {
  final AppException exception;

  const AllStudentsError({required this.exception});
}
