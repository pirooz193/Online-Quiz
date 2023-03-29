part of 'all_students_bloc.dart';

abstract class AllStudentsEvent extends Equatable {
  const AllStudentsEvent();

  @override
  List<Object> get props => [];
}

class StudentsScreenStarted extends AllStudentsEvent {}

class DeleteIconClicked extends AllStudentsEvent {}

class StudentsScreenRefresh extends AllStudentsEvent {}
