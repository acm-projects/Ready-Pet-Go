// ignore_for_file: prefer_const_constructors

//import 'package:brightowl_app/screens/onboardingpageScreen.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:front_end_faiza/login_page.dart';
import 'package:front_end_faiza/start_walk.dart';
import 'package:front_end_faiza/task_list.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: EasySplashScreen(
        logo: Image.asset('assets/images/dog_logo_transparent.png'),
        logoSize: 120,
        title: Text(
          "Ready, Pet, Go!",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        showLoader: true,
        loadingText: Text("Loading..."),
        //redirect to page you want it to go
        navigator: StudentLoginScreen(),
        durationInSeconds: 5,
      )),
      debugShowCheckedModeBanner: false,
    );
  }
}