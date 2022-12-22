import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Login_BLoc/auth_bloc.dart';
import '../Bloc/Login_BLoc/auth_state.dart';
import 'login/login_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // if (state.isLoading) {
        //   LoadingScreen.sharedInstance().show(
        //     context: context,
        //     text: state.textLoading,
        //   );
        // } else {
        //   LoadingScreen.sharedInstance().hide();
        // }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return Scaffold(
            body: Container(
              child: Text("Login Success"),
            ),
          );
        } else if (state is AuthStateLoggedOut) {
          return LoginScreen();
        }
        return Scaffold(
          body: Text("Nothing"),
        );
      },
    );
  }
}
