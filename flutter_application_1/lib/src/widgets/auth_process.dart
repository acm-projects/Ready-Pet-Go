import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'petCreationWidget.dart';


import 'home.dart';

class AuthProcess extends StatefulWidget {
  final String userID;
  const AuthProcess(this.userID, {Key? key}) : super(key: key);
  @override
  _AuthProcessState createState() => _AuthProcessState();
}

class _AuthProcessState extends State<AuthProcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return FutureBuilder(
      future: _petStatusCheck(),
      builder: (context, snapshot) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<String> _petStatusCheck() async {
    QuerySnapshot<Map<String, dynamic>> _query =
    await FirebaseFirestore.instance.collection('users').doc(widget.userID).collection('pets').get();
    if (_query.docs.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Home(widget.userID);
            },
          ),
        );
    } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return PetCreator(widget.userID);
            },
          ),
        );
    }
    return "Error";
  }
}