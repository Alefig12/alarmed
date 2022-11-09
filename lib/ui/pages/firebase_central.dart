import 'package:alarmed/ui/controllers/authentication_controller.dart';
import 'package:alarmed/ui/pages/login_page.dart';
import 'package:alarmed/ui/pages/navigation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseCentral extends StatelessWidget {
  const FirebaseCentral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const NavigationPage();
          } else {
            return const LoginPage();
          }
        });
  }
}
