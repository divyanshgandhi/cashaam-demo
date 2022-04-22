import 'package:cashaam/blocs/login/login_bloc.dart';
import 'package:cashaam/blocs/signup/signup_bloc.dart';
import 'package:cashaam/imports.dart';
import 'package:cashaam/components/icon.dart' as I;
import 'package:cashaam/components/button.dart' as B;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset("assets/shopping-elements.png"),
                const Positioned(
                  bottom: 24,
                  child: I.Icon(),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Text(
              "Buy & Sell",
              style: GoogleFonts.dmSans(
                color: const Color.fromARGB(255, 74, 74, 74),
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16.h),
            B.Button(
              isPrimary: true,
              text: "Login",
              onTap: () {
                Route route = MaterialPageRoute(
                  builder: (BuildContext context) => BlocProvider<LoginBloc>(
                    create: (BuildContext context) =>
                        LoginBloc()..add(LoginInitialEvent()),
                    child: LoginPage(),
                  ),
                );
                Navigator.push(context, route);
              },
            ),
            SizedBox(height: 2.h),
            B.Button(
              isPrimary: false,
              text: "Create an Account",
              onTap: () {
                Route route = MaterialPageRoute(
                  builder: (BuildContext context) => BlocProvider<SignupBloc>(
                    create: (BuildContext context) =>
                        SignupBloc()..add(SignupInitialEvent()),
                    child: SignupPage(),
                  ),
                );
                Navigator.push(context, route);
              },
            ),
            SizedBox(height: 4.h),
            GestureDetector(
              onTap: () => Fluttertoast.showToast(msg: "Feature coming soon"),
              child: Text(
                "Continue as Guest",
                style: GoogleFonts.dmSans(
                  color: primary,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
