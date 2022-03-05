import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ready_pet_go/pages/HomeScreen/widgets/pet_screen.dart';
import 'package:ready_pet_go/pages/HomeScreen/widgets/play_icon.dart';
import 'package:ready_pet_go/pages/HomeScreen/widgets/water_icon.dart';
import 'package:ready_pet_go/pages/HomeScreen/widgets/food_icon.dart';
import 'package:ready_pet_go/pages/HomeScreen/widgets/walk_icon.dart';
import 'package:ready_pet_go/pages/HomeScreen/widgets/list_icon.dart';


class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
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
                alignment: Alignment(0.0, 0.65),
                child: Text(
                  '''Max ''',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1.171875,
                    fontSize: 48.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),

                    /* letterSpacing: 0.0, */
                  ),
                ),
              ),

              Align(
                alignment: Alignment(-0.75, -0.75),
                child: GestureDetector(
                  onTap: ()=> print('Tapped'),
                  child: PlayIcon(),
                ),
              ),

              Align(
                alignment: Alignment(-0.25, -0.75),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed('/WaterScreen');
                  },
                  child: WaterIcon(),
                ),
              ),

              Align(
                alignment: Alignment(0.25, -0.75),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed('/WaterScreen');
                  },
                  child: FoodIcon(),
                ),
              ),

              Align(
                alignment: Alignment(0.75, -0.75),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed('/WaterScreen');
                  },
                  child: WalkIcon(),
                ),
              ),

              Align(
                alignment: Alignment(0.0, 0.0),
                child: PetImage(),
              ),

              Align(
                alignment: Alignment(-0.95, 0.95),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed('/WaterScreen');
                  },
                  child: ListIcon(),
                ),
              )
            ]),
      ),
    );
  }
}