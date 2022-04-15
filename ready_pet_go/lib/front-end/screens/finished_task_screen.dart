import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
             
              centerTitle: true,
              //title: Text('OPTIONS', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30)),
              backgroundColor: Colors.white,
              elevation: 0,
              
               
        
              // title: Padding(
              //   padding: const EdgeInsets.only(left: 85.0),
              //   child: Text('Completed Task'),
              // ),
              // backgroundColor: Color(0xFF00A5E0),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
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
                      const Align(
                        alignment: Alignment(0.0, -0.9),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'This task has been completed for the day!\n\n Come back tomorrow!',
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.171875,
                              fontSize: 25.0,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 0, 0, 0),

                              /* letterSpacing: 0.0, */
                            ),
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
                                    "assets/images/dog_icon_login_screen.png",
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
