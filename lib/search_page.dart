import 'package:flutter/material.dart';
import 'package:instagram_clon/create_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:_bulidbody(),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blueAccent
      )
    )
    ;
  }

  Widget _bulidbody() {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, //3개
      childAspectRatio: 1,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1
    ),
        itemCount: 5,
        itemBuilder: (context, index){
        return _bulidListItem(context, index);
      });
  }

  Widget _bulidListItem(BuildContext context, int index) {
      return Image.network('https://cdn.pixabay.com/photo/2019/11/18/06/43/flowers-4634053_960_720.png',fit: BoxFit.cover,);
  }
}
