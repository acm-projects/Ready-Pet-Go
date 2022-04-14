import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ready_pet_go/front-end/screens/start_walk_screen.dart';
import 'package:ready_pet_go/front-end/screens/login_screen.dart';

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

