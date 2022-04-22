part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupPassword extends SignupState {
  final String fName;
  final String lName;
  final String email;

  SignupPassword({
    required this.fName,
    required this.lName,
    required this.email,
  });
}

class SignupSuccess extends SignupState {
  final UserModel user;

  SignupSuccess({
    required this.user,
  });
}

class SignupError extends SignupState {
  final String error;

  SignupError({
    required this.error,
  });
}
