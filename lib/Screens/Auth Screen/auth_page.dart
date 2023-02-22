import 'package:besan_1/Screens/Auth%20Screen/login_or_register_screen.dart';
import 'package:besan_1/Screens/Dashboard%20Screen/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const DashboardScreen();
          }
          else {
            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
