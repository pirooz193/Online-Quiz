import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'teachers_event.dart';
part 'teachers_state.dart';

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  TeachersBloc() : super(TeachersInitial()) {
    on<TeachersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
