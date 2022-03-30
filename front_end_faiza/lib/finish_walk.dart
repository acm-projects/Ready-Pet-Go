import 'package:flutter/material.dart';

class FinishScreen extends StatefulWidget {
  @override
  _FinishScreenState createState() => _FinishScreenState();
}
class _FinishScreenState extends State<FinishScreen> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }
@override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
@override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      backgroundColor: Color(0xFF00A5E0),
      appBar: AppBar(
        title: Padding(
		  padding: const EdgeInsets.only(left: 95.0),
		  child: Text(' '),
      
		),
    elevation: 0.0,
    bottomOpacity: 0.0,
    backgroundColor: Color(0xFF00A5E0),

        //centerTitle: true,
        //automaticallyImplyLeading: false,
      
      leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
			tooltip: 'Menu',
			onPressed: () {},
      )
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text('You\'ve finished your\n             walk!\n',style: TextStyle(color: Colors.white, fontSize: 40.0),)),
            SizedBox(
              height: 20.0,
            ),
            Center(child: Icon(Icons.directions_walk, size: 50, color: Colors.white,)),
            Center(child: Text('Distance: 5.19 Miles',style: TextStyle(color: Colors.white, fontSize: 25.0),)),
            SizedBox(
              height: 20.0,
            ),
            Center(child: Icon(Icons.alarm, size: 50, color: Colors.white,)),
            Center(child: Text('Time: 53:04 Minutes\n',style: TextStyle(color: Colors.white, fontSize: 25.0),)),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: GestureDetector(
                onTapDown: _tapDown,
                onTapUp: _tapUp,
                child: Transform.scale(
                  scale: _scale,
                  child: _animatedButton(),
                ),
              ),
            ),
          ],
),
    );
  }
Widget  _animatedButton() {
    return Container(
      height: 70,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff82B26C),
              Color(0xff82B26C),
            ],
          )),
      child: Center(
        child: Text(
          'DONE',
          style: TextStyle(
              fontSize: 25.0,
              //fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
void _tapDown(TapDownDetails details) {
    _controller.forward();
  }
void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}