import 'package:flutter/material.dart';
import './home_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Padding(
                padding: EdgeInsets.only(left: 65.0),
                child: Text('Distance Tracker'),
              ),
              backgroundColor: const Color(0xFF00A5E0),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_sharp),
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
                child: SizedBox(
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
                        const Align(
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
                                feedback: ClipRRect(
                                  child: SizedBox(
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
                                childWhenDragging: const SizedBox(
                                  height: 54,
                                  width: 100,
                                ),
                                maxSimultaneousDrags: 1,
                                child: ClipRRect(
                                  child: SizedBox(
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
                                  return ClipRRect(
                                    child: SizedBox(
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
                                  );
                                },
                                onAccept: (bool data) {
                                  setState(() {
                                    acceptedData = data;
                                    if (acceptedData) {
                                      image =
                                          "lib/src/assets/images/HappyDog.png";
                                    }
                                  });
                                },
                              ),
                            ])
                      ],
                    )))));
  }
}
