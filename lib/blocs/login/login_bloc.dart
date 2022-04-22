import 'package:bloc/bloc.dart';
import 'package:cashaam/blocs/signup/signup_bloc.dart';
import 'package:cashaam/components/spinner.dart';
import 'package:cashaam/models/user_model.dart';
import 'package:cashaam/service_locator.dart';
import 'package:cashaam/services/auth_service.dart';
import 'package:cashaam/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:cashaam/components/text_field.dart';
import 'package:cashaam/imports.dart';
import 'package:cashaam/components/icon.dart' as I;
import 'package:cashaam/components/button.dart' as B;
import 'package:fluttertoast/fluttertoast.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_page.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginInitialEvent) {
        emit(LoginLoading());
        //TODO: Implement network connection check
        emit(LoginLoaded());
      }
      if (event is LoginInitiateEvent) {
        emit(LoginLoading());

        final String email = event.email;
        final String password = event.password;
        try {
          UserCredential userCredential =
              await locator<AuthService>().signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          // final SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.setString('uid', userCredential.user.uid);

          final UserModel user = await locator<UserService>().retrieveUser(
            uid: userCredential.user!.uid,
          );

          emit(LoginSuccess(user: user));
        } catch (error) {
          emit(LoginError(error: error.toString()));
        }
      }
    });
  }
}
