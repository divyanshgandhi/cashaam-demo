part of 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final CTextField email = CTextField(label: "Email");
  final CTextField password = CTextField(label: "Password", obscure: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Spinner(primary: true);
          }
          if (state is LoginLoaded) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back,
                            size: 24.sp,
                          ),
                        ),
                        I.Icon(),
                        Icon(
                          Icons.arrow_back,
                          size: 28.sp,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Login",
                    style: GoogleFonts.dmSans(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Login your account to\nunlock the happyness",
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  email,
                  password,
                  SizedBox(height: 6.h),
                  B.Button(
                    isPrimary: true,
                    text: "Login",
                    onTap: () {
                      print("Initiate login");
                      context.read<LoginBloc>().add(LoginInitiateEvent(
                          email: email.getInputText(),
                          password: password.getInputText()));
                    },
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Not a user?",
                    style: GoogleFonts.dmSans(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  GestureDetector(
                    onTap: () {
                      Route route = MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BlocProvider<SignupBloc>(
                          create: (BuildContext context) =>
                              SignupBloc()..add(SignupInitialEvent()),
                          child: SignupPage(),
                        ),
                      );
                      Navigator.push(context, route);
                    },
                    child: Text(
                      "Create an Account",
                      style: GoogleFonts.dmSans(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
