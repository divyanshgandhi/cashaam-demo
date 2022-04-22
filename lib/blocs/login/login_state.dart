part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel user;

  LoginSuccess({
    required this.user,
  });
}

class LoginError extends LoginState {
  final String error;

  LoginError({
    required this.error,
  });
}
