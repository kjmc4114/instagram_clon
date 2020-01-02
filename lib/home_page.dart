import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BamLet Test', style: TextStyle(color:  Colors.black , fontWeight: FontWeight.bold) ) ),
      body: _bulidBody(), // 객체는 Widget 으로 해줘야함.
    );
  }

  Widget _bulidBody() {
    return Padding(
       padding: EdgeInsets.all(8.0),
       child: SafeArea(
         child:SingleChildScrollView( // 스크롤을 아예넣어주는게 좋다.
           child:Center(
             child: Column(
                children: <Widget>[
                  Text('밤편지에 오신걸을 환영합니다.' , style: TextStyle(fontSize: 24.0),),
                  Padding(padding: EdgeInsets.all(8.0),),
                  Text('편지를 보내기위해 팔로우를 눌러주세요'),
                  Padding(padding: EdgeInsets.all(16.0),),
                  SizedBox(
                    width:300.0 ,
                    child: Card(
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.fromLTRB(0,8.0,0,8.0),),
                            SizedBox( // 감싸고 있는 위젯의 크기를 정해줌
                              width: 80.0,
                              height: 80.0,
                              child:CircleAvatar(
                                 backgroundImage:  NetworkImage(''),
                              )
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0,8.0,0,8.0),),
                            Text('E-mail@adress.com' , style: TextStyle(fontWeight: FontWeight.bold) ,),
                            Padding(padding: EdgeInsets.fromLTRB(0,4.0,0,4.0),),
                            Text('이름') ,
                            Padding(padding: EdgeInsets.all(8.0),),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                  SizedBox(
                                      width: 80.0,
                                      height: 80.0,
                                      child:Image.network('https://cdn.pixabay.com/photo/2015/07/28/22/03/fireworks-865104_960_720.jpg',fit: BoxFit.cover),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 4.0, 0),) ,
                                  SizedBox(
                                      width: 80.0,
                                      height: 80.0,
                                    child:Image.network('https://cdn.pixabay.com/photo/2015/07/28/22/03/fireworks-865104_960_720.jpg',fit: BoxFit.cover),
                                  )
                                  ,Padding(padding: EdgeInsets.fromLTRB(0, 0, 4.0, 0),) ,
                                  SizedBox(
                                      width: 80.0,
                                      height: 80.0,
                                  child:Image.network('https://cdn.pixabay.com/photo/2015/07/28/22/03/fireworks-865104_960_720.jpg',fit: BoxFit.cover),
                                  )
                              ],
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 4, 0, 4),) ,
                            Text('FaceBook 친구'),
                            Padding(padding: EdgeInsets.fromLTRB(0, 4, 0, 4),) ,
                            RaisedButton (child: Text('팔로우'), onPressed: () {}, color:Colors.blueAccent,  textColor: Colors.white,),
                            Padding(padding: EdgeInsets.fromLTRB(8.0,8.0,8.0,8.0),),
                          ],
                        ),
                      )
                    ),
                  )
                ],
             ),
           )
         )
       ),
    );
  }

}
