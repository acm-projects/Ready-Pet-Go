import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalkIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.all(Radius.circular(34))
      ),
      child: ClipOval(
        child: Container(
          color: Colors.white,
          width: 65.0,
          height: 64.0,
          child: Image.asset(
            "assets/images/Walk.png",
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