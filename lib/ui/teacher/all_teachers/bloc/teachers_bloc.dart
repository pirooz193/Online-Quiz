import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam_test/common/exception.dart';
import 'package:online_exam_test/data/repo/teacherRepository.dart';
import 'package:online_exam_test/data/teacher.dart';

part 'teachers_event.dart';
part 'teachers_state.dart';

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  TeachersBloc() : super(TeachersLoading()) {
    on<TeachersEvent>((event, emit) async {
      try {
        if (event is TeachersScreenStarted || event is TeachersScreenRefresh) {
          emit(TeachersLoading());
          final teachers = await teacherRepository.getAll();
          emit(TeachersSuccess(teachers));
        } else if (event is DeleteIconClicked) {
          await teacherRepository.deleteTeacherByCode(event.teacherCode);
        }
      } catch (error) {
        emit(TeachersError(
            exception: error is AppException ? error : AppException()));
      }
    });
  }
}
