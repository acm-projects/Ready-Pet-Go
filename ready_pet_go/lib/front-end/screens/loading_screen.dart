import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:ready_pet_go/front-end/screens/home_screen.dart';
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
        logo: Image.asset('assets/images/dog_icon_login_screen.png'),
        logoSize: 120,
        title: Text(
          "Ready, Pet, GO!",
          style: TextStyle(
            fontFamily: 'Chewy', 
            //fontWeight: FontWeight.w700,
            fontSize: 35,
          ),
        ),
        showLoader: true,
        loadingText: Text("Loading...", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w700, fontSize: 18)),
        //redirect to page you want it to go
        navigator: LoginScreen(),
        durationInSeconds: 2,
      )),
      debugShowCheckedModeBanner: false,
      
    );
  }
}
