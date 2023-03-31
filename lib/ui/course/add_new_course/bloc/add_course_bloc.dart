import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam_test/common/exception.dart';
import 'package:online_exam_test/data/repo/courseRepository.dart';

part 'add_course_event.dart';
part 'add_course_state.dart';

class AddCourseBloc extends Bloc<AddCourseEvent, AddCourseState> {
  AddCourseBloc() : super(AddCourseInitial()) {
    on<AddCourseEvent>((event, emit) {
      try {
        if (event is CreateCourseButtonClicked) {
          courseRepository.createNewCourse(
              event.title, event.capacity, event.teacherCode);
          emit(CreateCourseSuccess());
        }
      } catch (error) {
        emit(CreateCourseError(
            exception: error is AppException ? error : AppException()));
      }
    });
  }
}
