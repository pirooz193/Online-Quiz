part of 'add_course_bloc.dart';

abstract class AddCourseEvent extends Equatable {
  const AddCourseEvent();

  @override
  List<Object> get props => [];
}

class CreateCourseStarted extends AddCourseEvent {}

class CreateCourseButtonClicked extends AddCourseEvent {
  final String title;
  final String teacherCode;
  final int capacity;

  CreateCourseButtonClicked(this.title, this.teacherCode, this.capacity);
}
