part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupInitialEvent extends SignupEvent {}

class PasswordEvent extends SignupEvent {
  final String fName;
  final String lName;
  final String email;

  PasswordEvent({
    required this.fName,
    required this.lName,
    required this.email,
  });
}

class InitiateSignupEvent extends SignupEvent {
  final String fName;
  final String lName;
  final String email;
  final String password;

  InitiateSignupEvent({
    required this.fName,
    required this.lName,
    required this.email,
    required this.password,
  });
}
