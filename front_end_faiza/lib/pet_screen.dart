import 'package:flutter/cupertino.dart';

class PetImage extends StatelessWidget{
  const PetImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: 240.0,
      height: 329.0,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Image.asset(
          "assets/images/dog.png",
          color: null,
          fit: BoxFit.cover,
          width: 240.0,
          height: 329.0,
          colorBlendMode: BlendMode.dstATop,
        ),
      ),
    );
  }
}