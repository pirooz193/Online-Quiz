part of 'all_courses_bloc.dart';

abstract class AllCoursesEvent extends Equatable {
  const AllCoursesEvent();

  @override
  List<Object> get props => [];
}

class AllCoursesStartetd extends AllCoursesEvent {}

class RefreshAllCourses extends AllCoursesEvent {}

class StudentsButtonClicked extends AllCoursesEvent {
  final String courseCode;

  StudentsButtonClicked(this.courseCode);
}

class ExamsButtonClicked extends AllCoursesEvent {
  final String courseCode;

  ExamsButtonClicked(this.courseCode);
}

class NewCourseButtonClicked extends AllCoursesEvent {}
