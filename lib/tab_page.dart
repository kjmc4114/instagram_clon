import 'package:flutter/material.dart';

class Tabpage extends StatefulWidget {
  @override
  _TabpageState createState() => _TabpageState();
}

class _TabpageState extends State<Tabpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
         items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.home) ,title: Text('home')),
           BottomNavigationBarItem(icon: Icon(Icons.search) ,title: Text('찾기')),
           BottomNavigationBarItem(icon: Icon(Icons.account_box) ,title: Text('내정보')),
         ]
      ),
    );
  }
}
