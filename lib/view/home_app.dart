import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../Bloc/Login_BLoc/auth_bloc.dart';
import '../Bloc/Login_BLoc/auth_event.dart';
import '../provider/user_presence_provider.dart';
import '../provider/user_profile_provider.dart';
import '../theme/theme_data.dart';
import 'app.dart';

class HomeApp extends StatefulWidget {
  const HomeApp();

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    final userPresenceProvider = Provider.of<UserPresenceProvider>(context);
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        remoteUserProfileRepository:
            userProfileProvider.remoteUserProfileRepository,
        remoteUserPresenceRepository:
            userPresenceProvider.remoteUserPresenceRepository,
      )..add(
          AuthEventInitialize(),
        ),
      child: MaterialApp(
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        // supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        initialRoute: "/",
        home: App(),
      ),
    );
  }
}
