part of 'home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.white);
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: Spinner(primary: true),
            );
          }
          if (state is HomeLoaded) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    "Welcome, ${state.user.fName}",
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Joke of the Day",
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      color: colorPrimary,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      state.joke.type == "twopart"
                          ? state.joke.setup
                          : state.joke.joke,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  state.joke.type == "twopart"
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            state.joke.delivery,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSans(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 8.h),
                  InkWell(
                    onTap: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeInitialEvent(uid: state.user.uid));
                    },
                    child: Icon(
                      Icons.replay_outlined,
                      color: colorPrimary,
                      size: 28.sp,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Made with ❤️ by Divyansh",
                    style: GoogleFonts.roboto(),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    height: 0.2,
                    width: 40.w,
                    color: colorPrimary,
                  ),
                  SizedBox(height: 2.h),
                  GestureDetector(
                    onTap: () {
                      locator<AuthService>().signOut();
                    },
                    child: Text(
                      "Logout",
                      style: GoogleFonts.dmSans(
                        color: colorPrimary,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            );
          }
          return Container();
        },
        listener: (context, state) {},
      ),
    );
  }
}
