import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/widgets/home_screen.dart';

class TrackerScreen extends StatefulWidget {
  final String userID;
  const TrackerScreen(this.userID, {Key? key}) : super(key: key);

  @override
  State<TrackerScreen> createState() => _TrackingState();
}

class _TrackingState extends State<TrackerScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool setPos = false;
  double top = 120;
  double left = 140;
  String image = "assets/images/e69f6fd7c61b7fca781861df8b44a3c877d16753.png";
  bool acceptedData = false;
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: Text('Distance Tracker'),
              ),
              backgroundColor: Color(0xFF00A5E0),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_sharp),
                tooltip: 'Menu',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HomeScreen(widget.userID))));
                },
              ),
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
                        Align(
                          alignment: Alignment(0.0, -0.9),
                          child: Text(
                            '''Drag the hand to pet your pet''',
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
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                              ),
                              Draggable<bool>(
                                // Data is the value this Draggable stores.
                                data: true,
                                feedback: Container(
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100,
                                      height: 54,
                                      child: Image.asset(
                                        "lib/src/assets/images/Hand.png",
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
                                        "lib/src/assets/images/Hand.png",
                                        color: null,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //const Padding(padding: EdgeInsets.symmetric(vertical: 10),),

                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 60),
                              ),

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
                                    if (acceptedData)
                                      image =
                                          "lib/src/assets/images/HappyDog.png";
                                  });
                                },
                              ),
                            ])
                      ],
                    )))));
    /*double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 65.0),
              child: Text('Feeding Time'),
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
                        '''Drag the food to the bowl''',
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

                    Positioned(
                      top: height / 3.649586777,
                      left: width / 11.22077922,
                      child: Container(
                        child: ClipRRect(
                          child: Container(
                            color: Colors.white,
                            width: 300,
                            height: 30,
                            child: Image.asset(
                              "assets/images/Shelf.png",
                              color: null,
                              fit: BoxFit.cover,
                              width: 500,
                              height: 50,
                              colorBlendMode: BlendMode.dstATop,
                            ),
                          ),
                        ),
                      ),
                    ),
                    /*Align(
                      alignment: Alignment(0.0, -0.58),
                      child: Container(
                        child: ClipRRect(
                          child: Container(
                            width: 300,
                            height: 100,
                            child: Image.asset(
                              "assets/images/DogFood.png",
                              color: null,
                              //fit: BoxFit.cover,
                              colorBlendMode: BlendMode.dstATop,
                            ),
                          ),
                        ),
                      ),
                    ),*/

                    Positioned(
                      top: height / 1.905099778,
                      left: width / 3.570247934,
                      child: Container(
                        child: ClipRRect(
                          child: Container(
                            width: 150,
                            height: 90,
                            child: Visibility(
                              child: Image.asset(
                                "assets/images/DogBowl.png",
                                color: null,
                                //fit: BoxFit.cover,
                                colorBlendMode: BlendMode.dstATop,
                              ),
                              visible: true,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: height / 1.905099778,
                      left: width / 2.909090909,
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:
                            [
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),

                    Positioned(
                      top: height / 1.85974026,
                      left: width / 2.909090909,
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:
                            [
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),

                    Positioned(
                      top: height / 1.816490486,
                      left: width / 2.909090909,
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:
                            [
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Visibility(
                                    child: Image.asset(
                                      "assets/images/FoodPiece.png",
                                      color: null,
                                      //fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                    visible: setPos,
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),

                    Positioned(
                        top: height / 2.867532468,
                        left: width / 2.805194805,
                        child: Container(
                          child: Visibility(
                              child: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 100.0
                              ),
                              visible: setPos
                          ),
                        )
                    ),

                    GestureDetector(
                        child: Stack(
                            children:<Widget>[
                              Positioned(
                                top: top,
                                left: left,
                                child: Container(
                                  child: ClipRRect(
                                    child: Container(
                                      width: 80,
                                      height: 100,
                                      child: Image.asset(
                                        "assets/images/DogFood.png",
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
                              if(dd.localPosition.dy < height - 220 && dd.localPosition.dy > 0)
                                top = dd.localPosition.dy;
                              else if(dd.localPosition.dy <= 0)
                                top = 0;
                              else
                                top = height - 220;
                              if(dd.localPosition.dx < width - 95 && dd.localPosition.dx > 0)
                                left = dd.localPosition.dx;
                              else if(dd.localPosition.dx <= 0)
                                left = 0;
                              else
                                left = width - 95;
                              if((top >= 340 && top <= 440) && (left >= 100 && left <= 200))
                                setPos = true;
                            });
                          } else {
                            top = height / 6.509090909;
                            left = width / 2.618181818;
                          }
                        }
                    ),
                  ]),
            ),
          )
      ),
    );*/
  }
}
