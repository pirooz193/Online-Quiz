import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam_test/common/exception.dart';
import 'package:online_exam_test/data/repo/authrepository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      try {
        if (event is AuthButtonIsClicked) {
          emit(AuthLoading());
          await authRepository.login(event.username, event.password);
          emit(AuthSuccess());
        }
      } catch (error) {
        emit(AuthError(AppException()));
      }
    });
  }
}
