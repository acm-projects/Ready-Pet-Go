import 'package:flutter/cupertino.dart';

class PetIcon extends StatelessWidget {
  const PetIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      height: 329.0,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Image.asset(
          "lib/src/assets/images/e69f6fd7c61b7fca781861df8b44a3c877d16753.png",
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
