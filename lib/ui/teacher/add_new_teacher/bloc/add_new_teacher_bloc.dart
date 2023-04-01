import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam_test/common/exception.dart';
import 'package:online_exam_test/data/repo/teacherRepository.dart';

part 'add_new_teacher_event.dart';
part 'add_new_teacher_state.dart';

class AddNewTeacherBloc extends Bloc<AddNewTeacherEvent, AddNewTeacherState> {
  AddNewTeacherBloc() : super(AddNewTeacherInitial()) {
    on<AddNewTeacherEvent>((event, emit) {
      try {
        if (event is AddSTeacherButtonClicked) {
          teacherRepository.addNewTeacher(
              event.name, event.lastName, event.teacherCode, event.phoneNumber);
          emit(AddTeachersuccess());
        }
      } catch (error) {
        emit(AddTeacherError(
            exception: error is AppException ? error : AppException()));
      }
    });
  }
}
