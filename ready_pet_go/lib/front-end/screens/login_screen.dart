import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../back-end/services/authentication_services.dart';
import 'auth_process.dart';

final AuthenticationServices authServices = AuthenticationServices();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginPage({Key? key}) : super(key: key);

  // Duration get loginTime => const Duration(milliseconds: 200);

  //SIGN IN
  Future<String?> _authUser(LoginData data) async {
    //object to use functions from authentication services
    // final authService = AuthenticationServices();
    bool signInStatus = await authServices.signIn(data.name, data.password);
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
    String signInStatus = await authServices.register(
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
  //Can be improved: strong password

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
        title: "Ready, Pet, GO!",
        logo: const AssetImage('assets/images/dog_icon_login_screen.png'),
        onLogin: _authUser,
        //when sign in button is pressed
        // onSignup: _signupUser,
        onSignup: _signupUser,
        //when submit button is pressed
        onSubmitAnimationCompleted: () {
          //after sign in//register successful
          var userID = FirebaseAuth.instance.currentUser?.uid;
          debugPrint(
              "Context here " + context.toString() + " " + userID.toString());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                AuthProcess(userID.toString()), //Home page here
          ));
        },
        onRecoverPassword: _recoverPassword,
        theme: LoginTheme(
          //logoWidth: 0.6,
          primaryColor: Colors.white,
          accentColor: const Color(0xFF00A5E0),
          errorColor: Colors.red,
          titleStyle: const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
            color: Color(0xFF00A5E0),
            fontSize: 40.0,
            //fontStyle: 'San Francisco',
            //letterSpacing: 0,
            //fontWeight: FontWeight.w600,
          ),
          bodyStyle: const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
          // TextField(

          //               fillColor: Color(0xFF12366B),

          // ),
          textFieldStyle: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
            color: Colors.grey[600],
            //shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
          ),
          buttonStyle: const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
            fontSize: 17,
            //fontWeight: FontWeight.w800,
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
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              backgroundColor: Colors.red,
              color: Colors.white,
            ),
            labelStyle: const TextStyle(
              fontSize: 12,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
            ),
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
