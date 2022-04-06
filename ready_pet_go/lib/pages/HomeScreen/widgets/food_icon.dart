import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodIcon extends StatelessWidget{
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
          color: Colors.lightBlue,
          width: 65.0,
          height: 64.0,
          child: Image.asset(
            "assets/images/8d995a431eb0a65ffb2e71117c684dcb438d10b6.png",
            color: null,
            fit: BoxFit.cover,
            width: 49,
            height: 35,
            colorBlendMode: BlendMode.dstATop,
          ),
        ),
      ),
    );
  }
}