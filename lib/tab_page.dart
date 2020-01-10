import 'package:flutter/material.dart';
import 'package:instagram_clon/account_page.dart';
import 'package:instagram_clon/home_page.dart';
import 'package:instagram_clon/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Tabpage extends StatefulWidget {
  final FirebaseUser user;
  Tabpage(this.user); // 초기화

  @override
  _TabpageState createState() => _TabpageState();
}

class _TabpageState extends State<Tabpage> {

  int _selectedIndex = 0;
  List _pages ;

@override
  void initState() { // 생성자 다음에 수행하는것. 초기화 를 위해서 생성 타이밍이 안맞는다?
  super.initState();
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child:_pages[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex, //current index = 현재 페이지의 index 와 같다
        fixedColor: Colors.black,
        items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.home) ,title: Text('home')),
           BottomNavigationBarItem(icon: Icon(Icons.search) ,title: Text('찾기')),
           BottomNavigationBarItem(icon: Icon(Icons.account_box) ,title: Text('내정보')),
         ]
        ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
