import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:ready_pet_go/front-end/screens/login_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
        navigator: LoginScreen(),
        durationInSeconds: 2,
      )),
      debugShowCheckedModeBanner: false,
      
    );
  }
}
