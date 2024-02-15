import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:intention_for_today/features/home/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<auth.User?>(
      stream: auth.FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //User is not signed in
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
            ],
          );
        }

        //Render your application if auhtenticated
        return const HomePage();
      },
    );
  }
}
