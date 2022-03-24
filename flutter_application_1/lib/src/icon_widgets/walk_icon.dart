import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalkIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ClipOval(
        child: Container(
          color: Colors.white,
          width: 65.0,
          height: 64.0,
          child: Image.asset(
            "../images/Walk.png",
            color: null,
            width: 30,
            height: 5,
            colorBlendMode: BlendMode.dstATop,
          ),
        ),
      ),
    );
  }
}