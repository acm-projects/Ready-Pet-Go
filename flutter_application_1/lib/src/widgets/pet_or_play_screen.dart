import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/widgets/petting_screen.dart';
import 'package:flutter_application_1/src/widgets/playscreen.dart';
import 'package:flutter_application_1/src/widgets/home_screen.dart';

import '../models/pets.dart';
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
        home: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 85.0),
                child: Text('Options'),
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
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 240,
                              height: 80,
                              child: CupertinoButton(
                                  color: Colors.lightBlue,
                                  child: Text(
                                    "Pet the Dog",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 1.171875,
                                      fontSize: 20.0,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 255, 255, 255),

                                      /* letterSpacing: 0.0, */
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                PettingScreen(widget.pet,
                                                    widget.userID))));
                                  }),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 60),
                            ),
                            SizedBox(
                                width: 240,
                                height: 80,
                                child: CupertinoButton(
                                    color: Colors.green,
                                    child: Text(
                                      "Play with the Dog",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        height: 1.171875,
                                        fontSize: 20.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),

                                        /* letterSpacing: 0.0, */
                                      ),
                                    ),
                                    onPressed: () {
                                      if (widget.pet.tasks['Play']) {
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
                                    })),
                          ]),
                    ]),
              ),
            )));
  }
}
