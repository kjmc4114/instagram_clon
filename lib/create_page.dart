import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class CreatePage extends StatefulWidget {
  final FirebaseUser user;
  CreatePage(this.user);

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
           onPressed: (){
             final firebaseStageRef = FirebaseStorage.instance
                 .ref()
                 .child('post')
                 .child('${widget.user.email}'+'_'+'${DateTime.now().millisecondsSinceEpoch}.png');
             final task = firebaseStageRef.putFile(
               _image,
               StorageMetadata(contentType: 'image/png'));
             task.onComplete.then((value){ // 작업이 끝난뒤에
               var downloadUrl =   value.ref.getDownloadURL(); // var = object
               downloadUrl.then((uri){
                 downloadUrl.toString();
                 var doc = Firestore.instance.collection('post').document(); //firebase의 database
                                              // firebase의 collection 명
                 doc.setData({ // JSON  형태가 쉽다.
                   'id':doc.documentID,
                   'photoUrl' : uri.toString(),
                   'contents' : textEditinControllr.text,
                   'email' : widget.user.email,
                   'displayName' : widget.user.displayName,
                   'userPhotoUrl' : widget.user.photoUrl
                 }).then((onValue){
                   Navigator.pop(context); // 전화면으로 돌아감.
                 });
               });
             });
           },
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
