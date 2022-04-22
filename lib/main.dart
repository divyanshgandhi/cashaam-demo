import 'package:cashaam/blocs/home/home_bloc.dart';
import 'package:cashaam/service_locator.dart';
import 'package:cashaam/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cashaam/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashaam/pages/landing.dart';
import 'package:cashaam/components/spinner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocater();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'Cashaam Auth Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        // home: const LandingPage(),
        home: Scaffold(
          backgroundColor: primary,
          body: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Are you connected to the internet?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return StreamBuilder(
                  stream: locator<AuthService>().onAuthStateChanged(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    final User? firebaseUser = snapshot.data;

                    if (firebaseUser == null) {
                      return LandingPage();
                    } else {
                      return BlocProvider<HomeBloc>(
                        create: (BuildContext context) => HomeBloc()
                          ..add(HomeInitialEvent(uid: firebaseUser.uid)),
                        child: HomePage(),
                      );
                    }
                  },
                );
              }

              return const Center(
                child: Spinner(primary: false),
              );
            },
          ),
        ),
      ),
    );
  }
}
