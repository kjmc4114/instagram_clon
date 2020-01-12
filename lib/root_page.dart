import 'package:flutter/material.dart';
import 'package:instagram_clon/login_page.dart';
import 'package:instagram_clon/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  print('root_page created');
  return _handleCurrentScreen();
  }


  Widget _handleCurrentScreen() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
    /*    if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {*/
          if (snapshot.hasData) {
            return Tabpage(snapshot.data);
          }
          return LoginPage();
      /*  }*/
      },
    );
  }
}
