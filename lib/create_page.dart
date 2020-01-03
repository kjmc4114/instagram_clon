import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditinControllr = TextEditingController();
  @override
  void dispose() { // 메모리 해제 메소드
    textEditinControllr.dispose(); //화면이 소멸될때는 이 함수가 호출된다.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _bulidBody(),
      floatingActionButton: FloatingActionButton(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
         IconButton(
           icon: Icon(Icons.add),
           onPressed: (){

           },
         )
      ],
    );
  }

  Widget _bulidBody(){
    return Column(
      children: <Widget>[
        Text('noImage'),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요'),
          controller: textEditinControllr,
        )
      ],
    );
  }

}
