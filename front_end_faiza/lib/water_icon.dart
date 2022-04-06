import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaterIcon extends StatelessWidget{
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
            "assets/images/91c294f141f9a162e40c82c18c20285830a2fc63.png",
            color: null,
            width: 30,
            height: 41,
            colorBlendMode: BlendMode.dstATop,
          ),
        ),
      ),
    );
  }
}