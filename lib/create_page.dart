import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditinControllr = TextEditingController();
  File _image;

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: _getImage,
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
         IconButton(
           icon: Icon(Icons.add),
           onPressed: null,
         )
      ],
    );
  }

  Widget _bulidBody(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _image == null ? Text('noImage') : Image.file(_image),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
            controller: textEditinControllr,
          )
        ],
      ),
    );
  }
  // Future <File> 은 Return 이  Future, 그리고 변수는 File로 설정해 준다.
  Future _getImage() async { // 비동기식처리
   File image = await ImagePicker.pickImage(source: ImageSource.gallery);
   // 비동기 처리는 Future 미래에 File이 될 변수임.

   setState(() {
     _image = image;
   });
  }

}
