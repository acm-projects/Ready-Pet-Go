
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:flutter_application_1/src/widgets/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    title: 'Firebase Demo',
    home: LoginScreen(),
  ));
}
