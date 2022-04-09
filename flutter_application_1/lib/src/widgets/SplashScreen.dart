import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

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
        logo: Image.asset('lib/src/assets/images/dog_logo_transparent.png'),
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
        durationInSeconds: 5,
      )),
      debugShowCheckedModeBanner: false,
    );
  }
}
