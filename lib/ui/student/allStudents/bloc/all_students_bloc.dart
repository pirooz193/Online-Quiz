import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam_test/common/exception.dart';
import 'package:online_exam_test/data/repo/studentRepository.dart';
import 'package:online_exam_test/data/student.dart';

part 'all_students_event.dart';
part 'all_students_state.dart';

class AllStudentsBloc extends Bloc<AllStudentsEvent, AllStudentsState> {
  final IStudentRepository studentRepository;
  AllStudentsBloc(this.studentRepository) : super(StudentLoading()) {
    on<AllStudentsEvent>((event, emit) async {
      if (event is StudentsScreenStarted || event is StudentsScreenRefresh) {
        try {
          emit(StudentLoading());

          final students = await studentRepository.getAll();
          emit(StudentsSuccess(students));
        } catch (error) {
          emit(AllStudentsError(
              exception: error is AppException ? error : AppException()));
        }
      }
    });
  }
}
