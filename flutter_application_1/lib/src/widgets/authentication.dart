import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/widgets/petDisplay.dart';
import 'register.dart';
import '../provider_functions/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: _emailField,
                decoration: const InputDecoration(
                    hintText: "something@email.com",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: _passwordField,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "password",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                    //Navigate
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                },
                child: const Text("Register"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await signIn(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    //Navigate
                     FirebaseAuth auth = FirebaseAuth.instance;
                    var userID = auth.currentUser!.uid;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetDisplay(userID),
                      ),
                    );
                  } else {
                    // set up the button
                    Widget okButton = TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    );

                    // set up the AlertDialog
                    AlertDialog alert = AlertDialog(
                      title: const Text("Uncessful"),
                      content: const Text("Wrong email and/or password"),
                      actions: [
                        okButton,
                      ],
                    );

                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }
                },
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}