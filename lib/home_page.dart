import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Instagrame Clone', style: TextStyle(color:  Colors.black , fontWeight: FontWeight.bold) ) ),
      body: _bulidBody(), // 속성은 Widget 으로 해줘야함.
    );
  }

  Widget _bulidBody() {
    return Padding(
       padding: EdgeInsets.all(8.0), // 스크롤을 아예넣어주는게 좋다.
       child: SafeArea(
         child:SingleChildScrollView(
           child:Center(
             child: Column(
                children: <Widget>[
                  Text('인스타그램에 오신걸을 환영합니다.' , style: TextStyle(fontSize: 24.0),),
                  Padding(padding: EdgeInsets.all(8.0),),
                  Text('사진과 동영상을 보려면 팔로우 하세요.'),
                  Padding(padding: EdgeInsets.all(16.0),),
                  Card(
                    child: Column(
                      children: <Widget>[
                        RaisedButton (child: Text('팔로우'), onPressed: () {},)
                      ],
                    )
                  )
                ],
             ),
           )
         )
       ),
    );
  }

}
