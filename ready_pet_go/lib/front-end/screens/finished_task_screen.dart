import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './home_screen.dart';

class FinishedTaskScreen extends StatefulWidget {
  final String userID;

  const FinishedTaskScreen(this.userID, {Key? key}) : super(key: key);

  @override
  State<FinishedTaskScreen> createState() => _CompleteState();
}

class _CompleteState extends State<FinishedTaskScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 85.0),
                child: Text('Completed Task'),
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
                          'You already did this task. No need to do it yet.',
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
                          children: [
                            ClipRRect(
                              child: Container(
                                width: 240,
                                height: 329,
                                child: Visibility(
                                  child: Image.asset(
                                    "lib/src/assets/images/HappyDog.png",
                                    color: null,
                                    //fit: BoxFit.cover,
                                    colorBlendMode: BlendMode.dstATop,
                                  ),
                                  visible: true,
                                ),
                              ),
                            ),
                          ]),
                    ]),
              ),
            )));
  }
}
