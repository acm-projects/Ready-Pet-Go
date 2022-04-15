import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './petting_screen.dart';
import './playscreen.dart';
import './home_screen.dart';

import '../../back-end/models/pet.dart';
import 'finished_task_screen.dart';

class PetOrPlayScreen extends StatefulWidget {
  final Pet pet;
  final String userID;
  const PetOrPlayScreen(this.pet, this.userID, {Key? key}) : super(key: key);
  @override
  State<PetOrPlayScreen> createState() => _PetOrPlayScreenState();
}

class _PetOrPlayScreenState extends State<PetOrPlayScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Nunito'),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('OPTIONS', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 28)),
              backgroundColor: Colors.white,
              elevation: 3,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_sharp, color: Colors.black,),
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
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 330,
                              height: 80,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x80000000),
                                      blurRadius: 12.0,
                                      offset: Offset(0.0, 5.0),
                                    ),
                                  ],
                                ),
                                child: CupertinoButton(
                                  borderRadius: BorderRadius.circular(100.0),
                                    color: Color(0xFF00A5E0),
                                    child: Text(
                                      "Pet Your Dog!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        //height: 1.171875,
                                        fontSize: 30.0,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                              // child: CupertinoButton(
                              //     color: Colors.lightBlue,
                              //     child: Text(
                              //       "Pet the Dog",
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         height: 1.171875,
                              //         fontSize: 20.0,
                              //         fontFamily: 'Roboto',
                              //         fontWeight: FontWeight.w400,
                              //         color: Color.fromARGB(255, 255, 255, 255),

                              //         /* letterSpacing: 0.0, */
                              //       ),
                              //     ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                PettingScreen(widget.pet,
                                                    widget.userID))));
                                  }),
                            ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 60),
                            ),
                            SizedBox(
                                width: 330,
                                height: 80,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x80000000),
                                        blurRadius: 12.0,
                                        offset: Offset(0.0, 5.0),
                                      ),
                                    ],
                                  ),
                                  child: CupertinoButton(
                                    borderRadius: BorderRadius.circular(100.0),
                                      color: Color(0xff82B26C),
                                      child: Text(
                                        "Play With Toys!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 30.0,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromARGB(255, 255, 255, 255),
                                        ),
                                      ),
                                    onPressed: () {
                                      if (widget.pet.tasks!['Play']) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    FinishedTaskScreen(widget.userID))));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    PlayingScreen(widget.pet,
                                                        widget.userID))));
                                      }
                                    }))),
                          ]),
                    ]),
              ),
            )));
  }
}
