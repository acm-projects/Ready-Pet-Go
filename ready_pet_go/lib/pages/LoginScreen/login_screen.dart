import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'dashboard_screen.dart';


const users = {
   'dribbble@gmail.com': '12345',
   'hunter@gmail.com': 'hunter',
};

class StudentLoginScreen extends StatelessWidget {

   const StudentLoginScreen({Key? key}) : super(key: key);
   Duration get loginTime => const Duration(milliseconds: 200);

   Future<String?> _authUser(LoginData data) {
     debugPrint('Name: ${data.name}, Password: ${data.password}');
     return Future.delayed(loginTime).then((_) {
       if (!users.containsKey(data.name)) {
         return 'User not exists';
       }
       if (users[data.name] != data.password) {
         return 'Password does not match';
       }
       return null;
     });
   }

   Future<String?> _signupUser(SignupData data) {
     //additionalSignupFields: ["Phone Num", const UserFormField(keyName: 'userPhoneNumber', displayName: "Phone Number")];
     debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
     return Future.delayed(loginTime).then((_) {
       return null;
     });
   }

   Future<String> _recoverPassword(String name) {
     debugPrint('Name: $name');
     return Future.delayed(loginTime).then((_) {
       if (!users.containsKey(name)) {
         return 'User not exists';
       }
       // this is definitely wrong, idk what to put here
       return "else";
     });
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
                               //UserFormField(keyName: 'userPhoneNumber', displayName: "Phone Number")
                               ],
       title: 'Login/Signup',
       logo: const AssetImage(
         'assets/images/dog_logo_transparent.png'),
       onLogin: _authUser,
       onSignup: (_signupUser),
       onSubmitAnimationCompleted: () {
         // Navigator.of(context).pushReplacement(MaterialPageRoute(
         //   builder: (context) => DashboardScreen(),
         // ));
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
         textFieldStyle:
         TextStyle(
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
       )
     );
   }


}