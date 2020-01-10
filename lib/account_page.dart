import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountPage extends StatefulWidget {
  final FirebaseUser user;
  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold( //material UI
      appBar: _bulidAppBar(),
      body:  _bulidBody(),
    );
  }

  Widget _bulidAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon : Icon(Icons.exit_to_app),
          onPressed: () { // 눌렀을때 로그아웃 처리
              FirebaseAuth.instance.signOut();
              _googleSignIn.signOut();
          },
        )
      ],
    );
  }

 Widget _bulidBody() {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.user.photoUrl),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          SizedBox(
                              width: 28,
                              height: 28,
                              child: FloatingActionButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                                backgroundColor: Colors.white,
                              )
                          ),
                          SizedBox(
                              width: 25,
                              height: 25,
                              child: FloatingActionButton(
                                onPressed: () {},
                                child: Icon(Icons.add,), backgroundColor: Colors.blueAccent,
                              )
                          ),
                        ],
                      )
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.user.displayName , style: TextStyle(fontWeight:FontWeight.bold),),
              ],
            ),
          Text('0 \n 게시물' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),textAlign:TextAlign.center),
          Text('0 \n 팔로잉' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),textAlign:TextAlign.center),
          Text('0 \n 팔로워' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),textAlign:TextAlign.center),
          ],
        ),
    );
 }
}
