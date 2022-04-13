import 'package:flutter/material.dart';
import 'package:front_end_faiza/food_icon.dart';
import 'package:front_end_faiza/list_icon.dart';
import 'package:front_end_faiza/play_icon.dart';
import 'package:front_end_faiza/walk_icon.dart';
import 'package:front_end_faiza/water_icon.dart';
import 'package:front_end_faiza/pet_screen.dart';



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
      theme: ThemeData(fontFamily: 'Nunito'),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Ready, Pet, GO!',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  //fontStyle: FontStyle.italic,
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
                        'Help Guide',
                    ),
                    content: const Text(
                        '1. Click on the icons in the top row to do certain tasks.\n\n'
                        '2. Click on the list icon in the bottom left to check your to-do list.\n\n'
                        '3. Do these tasks daily and take great care of your pet.\n\n'
                        'Have fun!'),
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
                        '''Scout ''',
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          height: 1.171875,
                          fontSize: 48.0,
                          //fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
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