import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../bloc/LoginBloc/auth_bloc.dart';
import '../bloc/LoginBloc/auth_event.dart';
import '../provider/storage_provider.dart';
import '../provider/user_presence_provider.dart';
import '../provider/user_profile_provider.dart';
import '../theme/theme_data.dart';
import 'app.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({required this.tokenMessaging});
  final String tokenMessaging;
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    final userPresenceProvider = Provider.of<UserPresenceProvider>(context);
    final storageProvider = Provider.of<StorageProvider>(context);
    return BlocProvider(
      create: (context) => AuthBloc(
        remoteUserProfileRepository:
            userProfileProvider.remoteUserProfileRepository,
        remoteUserPresenceRepository:
            userPresenceProvider.remoteUserPresenceRepository,
        remoteStorageRepository: storageProvider.remoteStorageRepository,
        tokenMessaging: widget.tokenMessaging,
      )..add(
          AuthEventInitialize(),
        ),
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        initialRoute: "/",
        home: const App(),
      ),
    );
  }
}
