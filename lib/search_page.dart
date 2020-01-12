import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/create_page.dart';
import 'package:instagram_clon/detail_post_page.dart';

class SearchPage extends StatefulWidget {
  final FirebaseUser user;
  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:_bulidbody(),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blueAccent
      )
    )
    ;
  }

  Widget _bulidbody() {
    return StreamBuilder(
       stream: Firestore.instance.collection('post').snapshots(), // post데이터가 변경이 되면
        builder: (BuildContext context, AsyncSnapshot snapshot){
         // ignore: missing_return
         if(!snapshot.hasData){
           return Center(child: CircularProgressIndicator());
         } // 로딩만 빙글빙글
         var items = snapshot.data?.documents ?? []; //null 일때 처리 null 일때 빈리스트([]) 를만든다. null 처리

         return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //3개
            childAspectRatio: 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1
          ),
              itemCount: items.length ,
              itemBuilder: (context, index){
              return _bulidListItem(context, items[index]);
            });
        },
    );

  }

  Widget _bulidListItem(BuildContext context, document) { // document == Object
      return   Hero(
        tag: document['photoUrl'],
        child: Material(
          child: InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute (builder: (context){
                return DetailPostPage(document);
              }));
            },

            child: Image.network(
              document['photoUrl'],
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
  }
}
