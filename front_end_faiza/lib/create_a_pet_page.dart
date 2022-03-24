import 'package:flutter/material.dart';

class CreateAPet extends StatefulWidget {
  const CreateAPet({Key? key}) : super(key: key);

  @override
  _CreateAPetState createState() => _CreateAPetState();
}

class _CreateAPetState extends State<CreateAPet> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/dog_logo_transparent.png', height: 250, width: 250),
          const SizedBox(height: 20),
          const Text('Create A Pet To Get Started!', textScaleFactor: 2.0, style: TextStyle(color: Color(0xFF00A5E0))),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            //child: Text('Customize Your Pet'),
          ),
          Form(
            child: Column(
              children: const <Widget>[ 
              TextField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.border_color_outlined),
                    labelText: 'Pet Name',
                ),
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.cake_outlined),
                    labelText: 'Pet Birthday',
                ),
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.pets_outlined),
                    labelText: 'Pet Breed',
                ),
              ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}