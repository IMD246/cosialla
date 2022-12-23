import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'provider/list_repository_provider.dart';
import 'view/home_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final tokenMessaging = await FirebaseMessaging.instance.getToken();
  runApp(
    StartApp(
      tokenMessaging: tokenMessaging ?? "",
    ),
  );
}

class StartApp extends StatelessWidget {
  const StartApp({
    super.key,
    required this.tokenMessaging,
  });

  final String tokenMessaging;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getListRepositoryProvider(),
      builder: (context, child) {
        return HomeApp(
          tokenMessaging: tokenMessaging,
        );
      },
    );
  }
}
