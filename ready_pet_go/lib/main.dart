import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ready_pet_go/front-end/screens/start_walk_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPG Test',
      home: StartWalkScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
