import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
          onPressed: () {},
        )
      ],
    );
  }

 Widget  _bulidBody() {
    return Padding(
        padding: EdgeInsets.all(16),
        // child:
    );
 }
}
