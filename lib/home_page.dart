import 'package:flutter/material.dart';
import 'package:google_oauth_project/auth_page.dart';
import 'package:google_oauth_project/google_sigin_in_api.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  var user;
  HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: const Text('Home Page')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You\'re logged in as ${user.displayName} with google id of ***************${user.id.toString().substring(user.id.toString().length - 4)}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      print('Logout button pressed');
                      GoogleSignInHelper.logout(context);
                    },
                    child: const Text('Logout'))
              ]),
        ));
  }
}
