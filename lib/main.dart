import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:praktikum2/Login.dart';
import 'package:praktikum2/Navigation.dart';
import 'package:praktikum2/firebase_options.dart';
import 'package:praktikum2/register.dart';
import 'package:praktikum2/splashscreen.dart';


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
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          '/home': (context) => const Navigation(),
          '/login':(context) =>  const login(),
           '/register':(context) => const Register()
        },
    );
  }
}
