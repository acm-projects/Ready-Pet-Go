import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionPage extends StatefulWidget{
  const OptionPage({Key? key}) : super(key: key);
  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage>{
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
              title: Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Text('Options'),
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
                          'Choose what you want to do.',
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
                          children:[
                            SizedBox(
                              width: 240,
                              height: 80,
                              child: CupertinoButton(
                                  color: Colors.lightBlue,
                                  child: Text(
                                    "Pet your pet",
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
                                  onPressed: (){
                                    Navigator.of(context).pushReplacementNamed('/PettingScreen');
                                  }
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 60),),
                            SizedBox(
                              width: 240,
                              height: 80,
                              child: CupertinoButton(
                                    color: Colors.green,
                                    child: Text(
                                      "Play with your pet",
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
                                    onPressed: (){
                                      Navigator.of(context).pushReplacementNamed('/PlayingScreen');
                                    }
                                )
                            ),
                          ]
                      ),
                    ]),
              ),
            )
        )
    );
  }
}