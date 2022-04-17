import 'package:flutter/material.dart';

class FoodIcon extends StatelessWidget {
  const FoodIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(34))
          ),
      child: ClipOval(
        child: Container(
          color: Colors.lightBlue,
          width: 65.0,
          height: 64.0,
          child: Image.asset(
            "assets/images/tempfood.png",
            color: null,
            fit: BoxFit.cover,
            width: 49,
            height: 35,
            colorBlendMode: BlendMode.dstATop,
            //decoration: 
          ),
        ),
      ),
    );
  }
}
