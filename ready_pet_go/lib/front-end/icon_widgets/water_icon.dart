import 'package:flutter/material.dart';

class WaterIcon extends StatelessWidget {
  const WaterIcon({Key? key}) : super(key: key);

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
            "assets/images/tempwater.png",
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
