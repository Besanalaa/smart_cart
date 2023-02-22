import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:besan_1/Screens/Auth%20Screen/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Icons.shopping_cart_rounded,
        duration: 2000,
        splashIconSize: 200,
        backgroundColor: Colors.deepPurple.shade100,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const AuthPage(),
        // nextScreen: ProfileScreen(),
      ),
    );
  }
}

