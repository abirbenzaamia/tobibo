import 'package:flutter/material.dart';
import 'package:tobibo/src/screens/home_screen.dart';
import 'package:tobibo/src/screens/login_screen.dart';
import 'package:tobibo/src/screens/signup_screen.dart';
import 'package:tobibo/src/screens/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
      },
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      //home: FirebaseAuthDemo(),
    );
  }
}
