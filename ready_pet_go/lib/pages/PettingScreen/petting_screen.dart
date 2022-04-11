import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class PettingScreen extends StatefulWidget{
  const PettingScreen({Key? key}) : super(key: key);

  @override
  State<PettingScreen> createState() => _PettingPageState();
}

class _PettingPageState extends State<PettingScreen>{
  @override
  void initState()
  {
    super.initState();
  }
  double top = 120;
  double left = 120;
  String text = 'Drag the hand to pet your pet';
  bool setPos = false;
  String image = "assets/images/e69f6fd7c61b7fca781861df8b44a3c877d16753.png";
  bool acceptedData = false;

  var happyPet = ['Awwww, your pet looks happy!!!', 'Your pet is loving it!!!', 'Don\'t stop petting!!!', 'You are giving your pet the zoomies!!!', 'You are such a great petter!!!'];

  String getRandText(){
    var random = new Random();
    int index = random.nextInt(happyPet.length);
    return happyPet[index];
  }

  Widget build(BuildContext context){
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: Text('Petting Time'),
              ),
              backgroundColor: Color(0xFF00A5E0),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_sharp),
                tooltip: 'Menu',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/OptionScreen');
                },
              ),
            ),
            body: Center(
                child: Container(
                    width: sWidth,
                    height: sHeight,
                    color: Colors.white,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment(0.0, -0.9),
                          child: Text(
                            text,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.171875,
                              fontSize: 25.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0),

                              /* letterSpacing: 0.0, */
                            ),
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(padding: EdgeInsets.symmetric(vertical: 20),),
                              Draggable<bool>(
                                // Data is the value this Draggable stores.
                                data: true,
                                feedback: Container(
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100,
                                      height: 54,
                                      child: Image.asset(
                                        "assets/images/Hand.png",
                                        color: null,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                ),
                                childWhenDragging: Container(
                                  height: 54,
                                  width: 100,
                                ),
                                maxSimultaneousDrags: 1,
                                child: Container(
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100,
                                      height: 54,
                                      child: Image.asset(
                                        "assets/images/Hand.png",
                                        color: null,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //const Padding(padding: EdgeInsets.symmetric(vertical: 10),),

                              const Padding(padding: EdgeInsets.symmetric(vertical: 60),),

                              DragTarget<bool>(
                                builder: (
                                    BuildContext context,
                                    List<dynamic> accepted,
                                    List<dynamic> rejected,
                                    ) {
                                  return Container(
                                    child: ClipRRect(
                                      child: Container(
                                        width: 240,
                                        height: 329,
                                        child: Visibility(
                                          child: Image.asset(
                                            image,
                                            color: null,
                                            //fit: BoxFit.cover,
                                            colorBlendMode: BlendMode.dstATop,
                                          ),
                                          visible: true,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                onAccept: (bool data) {
                                  setState(() {
                                    acceptedData = data;
                                    if(acceptedData) {
                                      image = "assets/images/HappyDog.png";
                                      text = getRandText();
                                    }
                                  });
                                },),
                            ]
                        )
                      ],
                    )
                )
            )
        )
    );
    /*return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 65.0),
              child: Text('Petting Time'),
            ),
            backgroundColor: Color(0xFF00A5E0),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              tooltip: 'Menu',
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/HomeScreen');
              },
            ),
          ),
          body: Center(
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

                    /*Container(
                      width: 10,
                      height: 10,
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        children:[
                          ClipRRect(
                            borderRadius: BorderRadius.zero,
                            child: Container(
                              color: Colors.brown,
                            ),
                          ),
                        ]
                      )
                    ),*/

                    Align(
                      alignment: Alignment(0.0, -0.9),
                      child: Text(
                        text,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.171875,
                          fontSize: 25.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0),

                          /* letterSpacing: 0.0, */
                        ),
                      ),
                    ),

                    Positioned(
                      top: height / 2.6036363,
                      left: width / 6.5454545,
                      child: Container(
                        //width: 190,
                        //height: 267,
                        child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: Image.asset(
                            "assets/images/e69f6fd7c61b7fca781861df8b44a3c877d16753.png",
                            color: null,
                            fit: BoxFit.cover,
                            width: 240.0,
                            height: 329.0,
                            colorBlendMode: BlendMode.dstATop,
                          ),
                        ),
                      ),
                    ),
                    //"assets/images/e69f6fd7c61b7fca781861df8b44a3c877d16753.png"

                    Positioned(
                      top: 200,
                      left: 90,
                      child: SizedBox(
                          width: 200,
                          child: Visibility(
                            child: CupertinoButton(
                              color: Colors.green,
                              child: const Text(
                                "Pet again?",
                                style: TextStyle(color: Colors.white,),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                setState(() {
                                  setPos = false;
                                  text = 'Drag the hand to pet your pet';
                                });
                              },
                            ),
                            visible: setPos,
                          )
                      ),
                    ),

                    GestureDetector(
                        child: Stack(
                            children:<Widget>[
                              Positioned(
                                top: top,
                                left: left,
                                child: Container(
                                  width: 100,
                                  height: 54,
                                  child: ClipRRect(
                                    child: Container(
                                      width: 150,
                                      height: 82,
                                      child: Image.asset(
                                        "assets/images/Hand.png",
                                        color: null,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                        onVerticalDragUpdate: (DragUpdateDetails dd){
                          if(!setPos) {
                            setState(() {
                              if(dd.localPosition.dy < height - 170 && dd.localPosition.dy > 0)
                                top = dd.localPosition.dy;
                              else if(dd.localPosition.dy <= 0)
                                top = 0;
                              else
                                top = height - 170;
                              if(dd.localPosition.dx < width - 120 && dd.localPosition.dx > 0)
                                left = dd.localPosition.dx;
                              else if(dd.localPosition.dx <= 0)
                                left = 0;
                              else
                                left = width - 120;
                              if((top >= 300 && top <= 370) && (left >= 100 && left <= 200)) {
                                setPos = true;
                                text = 'Good job. You petted successfully';
                              }
                              else if((top >= 450 && top <= 550) && ((left >= 70 && left <= 140) || left <= 220)) {
                                setPos = true;
                                text = 'Good job. You petted successfully';
                              }
                              else if((top >= 370 && top <= 470) && (left >= 210 && left <= 225)){
                                setPos = true;
                                text = 'Do not poke your pet\'s face. Try again';
                              }
                            });
                          } else {
                            if((top >= 370 && top <= 470) && (left >= 210 && left <= 225)){
                              setPos = false;
                              //text = 'Do not poke your pet\'s face. Try again';
                            }
                            top = height / 6.5090909;
                            left = width / 3.27272727;
                          }
                        }
                    ),
                    Positioned(
                      top: height / 2.1110565,//top: 450-500 for back, 370-450 for face
                      left: width / 1.7454545,//left: 70-140 for back, 225 for edge of face
                      child: Container(
                        //width: 190,
                        //height: 267,
                        child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: Visibility(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.pink,
                              size: 24.0,
                              semanticLabel: 'Text to announce in accessibility modes',
                            ),
                            visible: setPos
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: height / 2.08290909,//top: 450-500 for back, 370-450 for face
                      left: width / 2.12285012,//left: 70-140 for back, 225 for edge of face
                      child: Container(
                        //width: 190,
                        //height: 267,
                        child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: Visibility(
                              child: Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 24.0,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                              visible: setPos
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          )
      ),
    );*/
  }
}