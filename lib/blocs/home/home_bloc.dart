import 'package:bloc/bloc.dart';
import 'package:cashaam/components/Spinner.dart';
import 'package:cashaam/models/joke_model.dart';
import 'package:cashaam/models/user_model.dart';
import 'package:cashaam/service_locator.dart';
import 'package:cashaam/services/auth_service.dart';
import 'package:cashaam/services/http_service.dart';
import 'package:cashaam/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:cashaam/imports.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_page.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInitialEvent) {
        emit(HomeLoading());
        final UserModel user =
            await locator<UserService>().retrieveUser(uid: event.uid);
        final JokeModel joke = await locator<HttpService>().getJoke();
        emit(HomeLoaded(
          user: user,
          joke: joke,
        ));
      }
    });
  }
}
