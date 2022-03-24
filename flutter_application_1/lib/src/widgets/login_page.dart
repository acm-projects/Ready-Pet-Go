import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'auth_process.dart';

import '../provider_functions/authentication_services.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // Duration get loginTime => const Duration(milliseconds: 200);

  //SIGN IN
  Future<String?> _authUser(LoginData data) async {
    //object to use functions from authentication services
    // final authService = AuthenticationServices();
    bool signInStatus = await signIn(data.name, data.password);
    if (signInStatus) {
      debugPrint("Login successfull login page");
      return null;
    }
    return "Wrong username and/or password!";
  }

  //REGISTER
  Future<String?> _signupUser(SignupData data) async {
    //object to use functions from authentication services
    // final authService = AuthenticationServices();
    String fullName = "";
    data.additionalSignupData?.forEach((key, value) {
      fullName += value;
      if (key == "firstName") {
        fullName += " ";
      }
    });
    String signInStatus = await register(
      data.name.toString(),
      data.password.toString(),
      fullName,
    );
    if (signInStatus == "successfully registered") {
      debugPrint("Register successful!");
      return null;
    }
    debugPrint(signInStatus);
    return "Email already used!";
  }

  //TODO: recover password
  Future<String?> _recoverPassword(String name) async {
    return "Function in progress!!!";
  }

  @override
  Widget build(BuildContext context) {
    const inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return FlutterLogin(
        additionalSignupFields: const [
          UserFormField(keyName: 'firstName', displayName: "First Name"),
          UserFormField(keyName: 'lasttName', displayName: "Last Name"),
        ],
        title: 'Login/Signup',
        logo: const AssetImage('../images/dog_logo_transparent.png'),
        onLogin: _authUser
        // await _authUser;
        // debugPrint("Moving to home");
        // var userID = FirebaseAuth.instance.currentUser?.uid;
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => Home(userID.toString()), //Home page here
        // ));
        , //when sign in button is pressed
        onSignup: _signupUser
        // _signupUser;
        // var userID = FirebaseAuth.instance.currentUser?.uid;
        // debugPrint("Moving to register pet");
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => PetRegister(userID.toString()), //Home page here
        // ));
        , //when submit button is pressed
        onSubmitAnimationCompleted: () {
          //after sign in//register successful
          var userID = FirebaseAuth.instance.currentUser?.uid;
          debugPrint(
              "Context here " + context.toString() + " " + userID.toString());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                AuthProcess(userID.toString()), //Home page here
          ));
          // String petStatus = _authNavigator(userID.toString()).toString();
          // if (petStatus == "pet existed") {
          //   Navigator.of(context).pushReplacement(MaterialPageRoute(
          //     builder: (context) => Home(userID.toString()), //Home page here
          //   ));
          //   debugPrint("Moved to Home!");
          // } else if (petStatus == "no pet existed") {
          //   debugPrint("Moving to reigster pet");
          //   Navigator.of(context).pushReplacement(MaterialPageRoute(
          //     builder: (context) => PetRegister(userID.toString()), //Home page here
          //   ));
          // } else {
          //   return "Error";
          // }
        },
        onRecoverPassword: _recoverPassword,
        theme: LoginTheme(
          //logoWidth: 0.6,
          primaryColor: Colors.white,
          accentColor: const Color(0xFF00A5E0),
          errorColor: Colors.red,
          titleStyle: const TextStyle(
            color: Color(0xFF00A5E0),
            fontSize: 40.0,
            //fontStyle: 'San Francisco',
            //letterSpacing: 0,
            fontWeight: FontWeight.w600,
          ),
          bodyStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
          // TextField(

          //               fillColor: Color(0xFF12366B),

          // ),
          textFieldStyle: TextStyle(
            color: Colors.grey[600],
            //shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
          ),
          buttonStyle: const TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          //card: Card(margin: EdgeInsets.only(top: 20.0)),
          cardTheme: const CardTheme(
            color: Color(0xFF00A5E0),
            elevation: 5,
            margin: EdgeInsets.only(top: 15),
            // shape: ContinuousRectangleBorder(
            //     borderRadius: BorderRadius.circular(50.0)),
          ),
          inputTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            errorStyle: const TextStyle(
              backgroundColor: Colors.red,
              color: Colors.white,
            ),
            labelStyle: const TextStyle(fontSize: 12),
            // enabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Color(0xFF12366B), width: 4),
            //   borderRadius: inputBorder,
            // ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF12366B), width: 5),
              borderRadius: inputBorder,
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade700, width: 7),
              borderRadius: inputBorder,
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade400, width: 8),
              borderRadius: inputBorder,
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 5),
              borderRadius: inputBorder,
            ),
          ),
          buttonTheme: const LoginButtonTheme(
            //color when click login
            splashColor: Color(0xFF8ECAE6),
            backgroundColor: Color(0xFF82B26C),
            highlightColor: Color(0xFF8ECAE6),
            elevation: 9.0,
            highlightElevation: 6.0,
            // shape: BeveledRectangleBorder(
            //   borderRadius: BorderRadius.circular(10),
            // ),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            // shape: CircleBorder(side: BorderSide(color: Colors.green)),
            // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
          ),
        ));
  }
}
