import 'package:drink_app1/pages/home_page.dart';
import 'package:drink_app1/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //neu la tk user
          if (snapshot.hasData) {
            return const HomePage();
            //khong phai la tk user
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
