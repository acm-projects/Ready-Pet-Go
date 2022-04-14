import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ClipRRect(
        child: Container(
          color: Colors.white,
          width: 100.0,
          height: 100.0,
          child: Image.asset(
            "lib/src/assets/images/Task.png",
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
