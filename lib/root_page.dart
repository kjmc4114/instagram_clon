import 'package:flutter/material.dart';
import 'package:instagram_clon/login_page.dart';
import 'package:instagram_clon/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged, // firebase의 상태변화에 따른 steam 유입
      builder: (BuildContext context, AsyncSnapshot snapshot) { // snapshot = firebase 유저가 들어옴.
      if(snapshot.hasData){
          return Tabpage(snapshot.data); // dynamic == object
        }else {
          return LoginPage();
        }
    },);
  }
}
