part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {
  final String uid;

  HomeInitialEvent({
    required this.uid,
  });
}

class FetchNewEvent extends HomeEvent {}

class LogOutEvent extends HomeEvent {}
