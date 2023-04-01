part of 'teachers_bloc.dart';

abstract class TeachersState extends Equatable {
  const TeachersState();

  @override
  List<Object> get props => [];
}

class TeachersInitial extends TeachersState {}

class TeachersLoading extends TeachersState {}

// class AllStudentsInitial extends AllStudentsState {}

class TeachersSuccess extends TeachersState {
  final List<TeacherEntity> teachers;

  const TeachersSuccess(this.teachers);
}

class TeachersError extends TeachersState {
  final AppException exception;

  const TeachersError({required this.exception});
}
