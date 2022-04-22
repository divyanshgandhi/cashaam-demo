part of 'signup_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final CTextField fName = CTextField(label: "First Name");
  final CTextField lName = CTextField(label: "Last Name");
  final CTextField email = CTextField(label: "Email");
  final CTextField password = CTextField(label: "Password", obscure: true);
  final CTextField confirmPassword = CTextField(
    label: "Confirm Password",
    obscure: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignupBloc, SignupState>(
        builder: (context, state) {
          if (state is SignupLoading) {
            return const Center(
              child: Spinner(
                primary: true,
              ),
            );
          }
          if (state is SignupInitial) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  I.Icon(),
                  SizedBox(height: 8.h),
                  Text(
                    "Create an Account",
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Create a new account to\nfind your desired product",
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  fName,
                  lName,
                  email,
                  SizedBox(height: 6.h),
                  B.Button(
                    isPrimary: true,
                    text: "Next",
                    onTap: () {
                      context.read<SignupBloc>().add(PasswordEvent(
                            fName: fName.getInputText(),
                            lName: lName.getInputText(),
                            email: email.getInputText(),
                          ));
                    },
                  ),
                  SizedBox(height: 2.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        color: colorPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is SignupPassword) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  I.Icon(),
                  SizedBox(height: 8.h),
                  Text(
                    "Set a password",
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Set a strong password to secure your account",
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  password,
                  confirmPassword,
                  SizedBox(height: 6.h),
                  B.Button(
                    isPrimary: true,
                    text: "Create account",
                    onTap: () {
                      if (password.getInputText() ==
                          confirmPassword.getInputText()) {
                        context.read<SignupBloc>().add(InitiateSignupEvent(
                              fName: state.fName,
                              lName: state.lName,
                              email: state.email,
                              password: password.getInputText(),
                            ));
                      } else {
                        Fluttertoast.showToast(msg: "Passwords don't match");
                      }
                    },
                  ),
                  SizedBox(height: 2.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        color: colorPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return Container();
        },
        listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
