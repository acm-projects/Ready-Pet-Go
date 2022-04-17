import 'package:flutter/material.dart';

class WalkIcon extends StatelessWidget {
  const WalkIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(34))
          ),
      child: ClipOval(
        child: Container(
          color: Colors.white,
          width: 65.0,
          height: 64.0,
          child: Image.asset(
            "assets/images/tempwalk2.png",
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
