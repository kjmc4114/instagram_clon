import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/retroslider_thumbshape.dart';
import 'package:instagram_clon/retroslider_trackshape.dart';


class WriteLetter extends StatefulWidget {
  final FirebaseUser user;
  WriteLetter(this.user);

  @override
  _WriteLetterState createState() => _WriteLetterState();
}

class _WriteLetterState extends State<WriteLetter> {
  double _values = 2.5 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _bulidBody(),
    );

  }

  Widget _bulidBody() {

    return SafeArea(

      child: Center(
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 3,
            activeTrackColor: Colors.white,
            trackShape: RetroSliderTrackShape(),
            thumbColor: Colors.white,
            thumbShape:
            RetroSliderThumbShape(thumbRadius: 5),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
          ),
          child: Slider(
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            value: _values,
            min: 0,
            max: 5,
            onChanged: (value){
              setState(() {
                _values = value;
              });
            },
            divisions: 5,
          ),
        ),
      ),
    );
  }
}
