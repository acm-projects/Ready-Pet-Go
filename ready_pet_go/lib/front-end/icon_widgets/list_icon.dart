
import 'package:flutter/material.dart';

class ListIcon extends StatelessWidget {
  const ListIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        color: Colors.white,
        width: 100.0,
        height: 100.0,
        child: Image.asset(
          "assets/images/temptasks.png",
          color: null,
          width: 30,
          height: 5,
          colorBlendMode: BlendMode.dstATop,
        ),
      ),
    );
  }
}
