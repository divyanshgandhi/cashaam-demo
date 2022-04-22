part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final UserModel user;
  final JokeModel joke;

  HomeLoaded({
    required this.user,
    required this.joke,
  });
}

class HomeError extends HomeState {}
