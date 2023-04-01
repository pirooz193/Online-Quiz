part of 'teachers_bloc.dart';

abstract class TeachersEvent extends Equatable {
  const TeachersEvent();

  @override
  List<Object> get props => [];
}

class TeachersScreenStarted extends TeachersEvent {}

class DeleteIconClicked extends TeachersEvent {
  final String teacherCode;

  DeleteIconClicked(this.teacherCode);
}

class TeachersScreenRefresh extends TeachersEvent {}
