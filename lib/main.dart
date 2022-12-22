import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'bloc/login_bloc/auth_bloc.dart';
import 'bloc/login_bloc/auth_event.dart';
import 'bloc/login_bloc/auth_state.dart';
import 'firebase_options.dart';
import 'helpers/loading/loading_screen.dart';
import 'provider/user_presence_provider.dart';
import 'provider/user_profile_provider.dart';
import 'repositories/remote_repository/remote_user_presence_repository.dart';
import 'repositories/remote_repository/remote_user_profile_repository.dart';
import 'theme/theme_data.dart';
import 'view/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    StartApp(),
  );
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProfileProvider>(
          create: (context) => UserProfileProvider(
            remoteUserProfileRepository: RemoteUserProfileRepository(),
          ),
        ),
        ChangeNotifierProvider<UserPresenceProvider>(
          create: (context) => UserPresenceProvider(
            remoteUserPresenceRepository: RemoteUserPresenceRepository(),
          ),
        )
      ],
      builder: (context, child) {
        return HomeApp1();
      },
    );
  }
}

class HomeApp1 extends StatefulWidget {
  const HomeApp1({Key? key}) : super(key: key);

  @override
  State<HomeApp1> createState() => _HomeApp1State();
}

class _HomeApp1State extends State<HomeApp1> {
  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    final userPresenceProvider = Provider.of<UserPresenceProvider>(context);
    return BlocProvider(
      create: (context) => AuthBloc(
        remoteUserProfileRepository:
            userProfileProvider.remoteUserProfileRepository,
        remoteUserPresenceRepository:
            userPresenceProvider.remoteUserPresenceRepository,
      )..add(
          AuthEventInitialize(),
        ),
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        home: const App1(),
      ),
    );
  }
}

class App1 extends StatefulWidget {
  const App1({Key? key}) : super(key: key);

  @override
  State<App1> createState() => _App1State();
}

class _App1State extends State<App1> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: size,
      builder: (context, child) {
        return BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isLoading) {
              LoadingScreen().show(
                context: context,
                text: state.textLoading,
              );
            } else {
              LoadingScreen().hide();
            }
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
            } else {
              return Scaffold(
                body: Text("Nothing"),
              );
            }
          },
        );
      },
    );
  }
}
