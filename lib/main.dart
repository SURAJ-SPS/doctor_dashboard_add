import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/util/theme_util.dart';
import 'features/presentation/pages/login_screen.dart';
import 'features/presentation/pages/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeUtil.themeData,
      initialRoute: LoginScreen.id,
      home: const SplashScreen(),
    );
  }
}
