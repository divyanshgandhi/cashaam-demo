import 'package:bloc/bloc.dart';
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

part 'signup_event.dart';
part 'signup_state.dart';
part 'signup_page.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignupInitialEvent) {
        emit(SignupLoading());
        //TODO: Implement network connection check
        emit(SignupInitial());
      }
      if (event is PasswordEvent) {
        emit(SignupPassword(
          fName: event.fName,
          lName: event.lName,
          email: event.email,
        ));
      }
      if (event is InitiateSignupEvent) {
        emit(SignupLoading());

        final fName = event.fName;
        final lName = event.lName;
        final email = event.email;
        final password = event.password;

        try {
          final UserCredential userCredential = await locator<AuthService>()
              .createUserWithEmailAndPassword(email: email, password: password);

          final User? user = userCredential.user;

          UserModel userModel = UserModel(
            email: email,
            uid: user!.uid,
            fName: fName,
            lName: lName,
          );

          await locator<UserService>().createUser(user: userModel);
          emit(SignupSuccess(user: userModel));
        } catch (error) {
          emit(SignupError(error: error.toString()));
        }
      }
    });
  }
}
