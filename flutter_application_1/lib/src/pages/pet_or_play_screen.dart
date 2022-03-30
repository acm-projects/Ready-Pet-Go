import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/pages/PettingScreen/petting_screen.dart';
import 'package:flutter_application_1/src/widgets/home.dart';

class OptionPage extends StatefulWidget {
  final String userID;
  const OptionPage(this.userID, {Key? key}) : super(key: key);
  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Home(widget.userID))));
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
                                    builder: ((context) => PettingScreen(widget.userID))));
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
                                      //to be implemented?
                                    })),
                          ]),
                    ]),
              ),
            )));
  }
}
