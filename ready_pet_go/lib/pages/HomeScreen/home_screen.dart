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
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            //centerTitle: true,
            title: Text('Ready Pet Go',
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.question_mark_rounded, color: Colors.black),
                tooltip: 'Instructions',
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                        'Guidelines',
                    ),
                    content: const Text('Here are some instructions to guide you.\n\n'
                        '1. Click on the icons in the top row to do certain tasks. You will be given instructions'
                        ' on how to do those tasks.\n\n'
                        '2. Click on the list icon in the bottom to check your tasks. '
                        'Do these tasks daily and take great care of your pet.\n\n'
                        'HAVE FUN!!!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              ),
              /*IconButton(
                icon: Icon(Icons.settings, color: Colors.black),
                tooltip: 'Settings',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/HomeScreen');
                },
              ),*/
              IconButton(
                icon: Icon(Icons.logout, color: Colors.black),
                tooltip: 'Log Out',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/HomeScreen');
                },
              ),
            ]
          ),
        body: Center(
          child: Container(
            width: sWidth,
            height: sHeight,
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

                  Column(
                    children:[
                      const Padding(padding: EdgeInsets.symmetric(vertical: 20),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const Padding(padding: EdgeInsets.symmetric(vertical: 90),),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushReplacementNamed('/OptionScreen');
                            },
                            child: PlayIcon(),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushReplacementNamed('/WaterScreen');
                            },
                            child: WaterIcon(),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushReplacementNamed('/FeedingScreen');
                            },
                            child: FoodIcon(),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushReplacementNamed('/TrackingScreen');
                            },
                            child: WalkIcon(),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 45),),
                      PetImage(),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5),),
                      Text(
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
                      //const Padding(padding: EdgeInsets.symmetric(vertical: 5),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushReplacementNamed('/WaterScreen');
                            },
                            child: ListIcon(),
                          ),
                        ],
                      )
                    ]
                  ),
                ]),
          ),
        )
      )
    );
  }
}