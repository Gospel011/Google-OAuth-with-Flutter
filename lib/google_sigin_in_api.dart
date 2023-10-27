import 'package:flutter/material.dart';
import 'package:google_oauth_project/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_page.dart';

class GoogleSignInHelper {
  static final _signInObject = GoogleSignIn(scopes: ['email', 'profile']);

  //? LOGIN METHOD
  static Future<void> login(BuildContext context) async {
    final GoogleSignInAccount? user = await _signInObject.signIn();

    if (context.mounted) {
      navigateTo(context, HomePage(user: user));
    }
  }

  //? LOGOUT METHOD
  static Future<void> logout(BuildContext context) async {
    _signInObject.disconnect();

    if (context.mounted) {
      navigateTo(context, const AuthPage(title: 'Google OAuth Project'));
    }
  }

  static void navigateTo(BuildContext context, Widget page) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }
}
