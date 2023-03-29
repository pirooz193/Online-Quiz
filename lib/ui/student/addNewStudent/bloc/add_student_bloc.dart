import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam_test/common/exception.dart';
import 'package:online_exam_test/data/source/studentDataSource.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentBloc() : super(AddStudentInitial()) {
    on<AddStudentEvent>((event, emit) {
      try {
        if (event is AddStudentButtonClicked) {
          studentRepository.createNewStudent(
              event.name, event.lastName, event.studentCode, event.phoneNumber);
          emit(AddStudentsuccess());
        }
      } catch (error) {
        emit(AddStudentError(
            exception: error is AppException ? error : AppException()));
      }
    });
  }
}
