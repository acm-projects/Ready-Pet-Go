import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ready_pet_go/pages/HomeScreen/widgets/pet_screen.dart';
import 'package:ready_pet_go/pages/HomeScreen/widgets/play_icon.dart';


class WaterScreen extends StatefulWidget{
  const WaterScreen({Key? key}) : super(key: key);

  @override
  State<WaterScreen> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterScreen>{
  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Material(
      child: Container(
        width: 375.0,
        height: 812.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),

              Align(
                alignment: Alignment(0.0, -0.675),
                child: Text(
                  '''Tap the screen to give the dog water''',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.171875,
                    fontSize: 30.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),

                    /* letterSpacing: 0.0, */
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}