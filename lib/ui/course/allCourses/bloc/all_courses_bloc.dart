import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam_test/common/exception.dart';
import 'package:online_exam_test/data/course.dart';
import 'package:online_exam_test/data/repo/courseRepository.dart';

part 'all_courses_event.dart';
part 'all_courses_state.dart';

class AllCoursesBloc extends Bloc<AllCoursesEvent, AllCoursesState> {
  AllCoursesBloc() : super(CoursesLoading()) {
    on<AllCoursesEvent>((event, emit) async {
      try {
        if (event is AllCoursesStartetd || event is RefreshAllCourses) {
          emit(CoursesLoading());
          final allCourses = await courseRepository.getAll();
          emit(AllCoursesuccess(allCourses));
        } else if (event is StudentsButtonClicked) {
          emit(CourseStudnets());
        } else if (event is ExamsButtonClicked) {
          emit(CourseExams());
        }
      } catch (error) {
        emit(CoursesError(
            exception: error is AppException ? error : AppException()));
      }
    });
  }
}
