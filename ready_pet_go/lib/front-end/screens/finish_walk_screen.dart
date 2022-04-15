import 'package:flutter/material.dart';

class FinishScreen extends StatefulWidget {
  final double _totalDistance;
  final String _totalDuration;
  const FinishScreen(this._totalDistance, this._totalDuration, {Key? key}) : super(key: key);
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
      duration: const Duration(
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
      backgroundColor: const Color(0xFF00A5E0),
      appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 95.0),
            child: Text(' '),

          ),
          elevation: 0.0,
          bottomOpacity: 0.0,
          backgroundColor: const Color(0xFF00A5E0),

          //centerTitle: true,
          //automaticallyImplyLeading: false,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            tooltip: 'Menu',
            onPressed: () {
              // TODO: go back to previous screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>Home(FirebaseAuth.instance.currentUser?.uid as String),
              //   ),
              // );
            },
          )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Center(child: Text('You\'ve finished your\n             walk!\n',
          style: TextStyle(color: Colors.white, fontFamily: 'Nunito', fontWeight: FontWeight.w700, fontSize: 40.0),)),
          const SizedBox(
            height: 20.0,
          ),
          const Center(child: Icon(Icons.directions_walk, size: 50, color: Colors.white,)),
          Center(child: Text('Distance: ${widget._totalDistance.toStringAsFixed(1)} Feet',style: const TextStyle(color: Colors.white, fontFamily: 'Nunito', fontWeight: FontWeight.w700, fontSize: 25.0),)),
          const SizedBox(
            height: 20.0,
          ),
          const Center(child: Icon(Icons.alarm, size: 50, color: Colors.white,)),
          Center(child: Text('Time: ${widget._totalDuration}\n',style: const TextStyle(color: Colors.white, fontFamily: 'Nunito', fontWeight: FontWeight.w700, fontSize: 25.0),)),
          const SizedBox(
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
            const BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff82B26C),
              Color(0xff82B26C),
            ],
          )),
      child: const Center(
        child: Text(
          'DONE',
          style: TextStyle(
            fontFamily: 'Nunito', 
            fontWeight: FontWeight.w700,
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