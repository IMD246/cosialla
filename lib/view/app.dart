import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/LoginBloc/auth_bloc.dart';
import '../bloc/LoginBloc/auth_state.dart';
import '../helpers/loading/loading_screen.dart';
import 'login/login_screen.dart';
import 'root_app.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: size,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isLoading) {
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  LoadingScreen().show(
                    context: context,
                    text: state.textLoading,
                  );
                },
              );
            } else {
              LoadingScreen().hide();
            }
          },
          builder: (context, state) {
            if (state is AuthStateLoggedIn) {
              return RootApp(
                userProfile: state.userProfile,
              );
            } else {
              return LoginScreen();
            }
          },
        );
      },
    );
  }
}
