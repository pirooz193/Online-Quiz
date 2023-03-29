part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthError extends AuthState {
  final AppException exception;

  AuthError(this.exception);
}

class AuthSuccess extends AuthState {}

class AuthLoading extends AuthState {}
