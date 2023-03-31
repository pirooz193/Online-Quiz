part of 'all_courses_bloc.dart';

abstract class AllCoursesState extends Equatable {
  const AllCoursesState();

  @override
  List<Object> get props => [];
}

class AllCoursesInitial extends AllCoursesState {}

class AllCoursesuccess extends AllCoursesState {
  final List<CourseEntity> allCourses;

  AllCoursesuccess(this.allCourses);
}

class CoursesLoading extends AllCoursesState {}

class CoursesError extends AllCoursesState {
  final AppException exception;

  CoursesError({required this.exception});
}

class CourseStudnets extends AllCoursesState {}

class CourseExams extends AllCoursesState {}
