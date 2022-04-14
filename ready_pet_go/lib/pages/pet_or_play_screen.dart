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
        theme: ThemeData(fontFamily: 'Nunito'),
        home: Scaffold(
            appBar: AppBar(
              //elevation: 0,
              centerTitle: true,
              title: Text('OPTIONS',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30
                ),
              ),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
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

                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
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
                                        height: 1.171875,
                                        fontSize: 30.0,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 255, 255, 255),

                                        /* letterSpacing: 0.0, */
                                      ),
                                    ),
                                    onPressed: (){
                                      Navigator.of(context).pushReplacementNamed('/PettingScreen');
                                    }
                                ),
                              ),

                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 60),),
                            SizedBox(
                              width: 330,
                              height: 80,
                              child: Container(
                                  decoration:BoxDecoration(
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
                                          color: Color.fromARGB(255, 255, 255, 255),

                                          /* letterSpacing: 0.0, */
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.of(context).pushReplacementNamed('/PlayingScreen');
                                      }
                                  )
                              ),
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