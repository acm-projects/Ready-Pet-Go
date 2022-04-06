import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayIcon extends StatelessWidget{
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
            "assets/images/Toy.png",
            color: null,
            width: 70,
            height: 70,
            colorBlendMode: BlendMode.dstATop,
          ),
        ),
      ),
      /*
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipOval(
            child: Container(
              color: Colors.lightBlue,
              width: 65.0,
              height: 64.0,
              child: Image.asset(
                "assets/images/31312dc9bfd271c97b39383f5298a128c49ea891.png",
                color: null,
                width: 41.97916793823242,
                height: 40.8510627746582,
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
          ),
          //8d995a431eb0a65ffb2e71117c684dcb438d10b6
          ClipOval(
            child: Container(
              color: Colors.lightBlue,
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
          ClipOval(
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
          ClipOval(
            child: Container(
              color: Colors.lightBlue,
              width: 65.0,
              height: 64.0,
              child: Image.asset(
                "assets/images/584cfbedab1a1a9cb7749c65e6bf9e4e22005996.png",
                color: null,
                width: 30,
                height: 5,
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
          ),
        ]
      )*/
    );
  }
}