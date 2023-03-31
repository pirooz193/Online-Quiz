part of 'add_course_bloc.dart';

abstract class AddCourseState extends Equatable {
  const AddCourseState();

  @override
  List<Object> get props => [];
}

class AddCourseInitial extends AddCourseState {}

class CreateCourseSuccess extends AddCourseState {}

class CreateCourseError extends AddCourseState {
  final AppException exception;

  CreateCourseError({required this.exception});
}
