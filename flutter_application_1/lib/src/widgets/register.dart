import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/widgets/petCreationWidget.dart';
import '../provider_functions/flutterfire.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  //editing Controllers
  final TextEditingController _nameField =  TextEditingController();
  final TextEditingController _ageField =  TextEditingController();
  final TextEditingController _emailField =  TextEditingController();
  final TextEditingController _passwordField =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: _nameField,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please enter your name");
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "John Doe",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Name",
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
                controller: _ageField,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return ("Please enter your age");
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "20",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Age",
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
                controller: _emailField,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please enter your email");
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please enter a valid email");
                  }
                  return null;
                },
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
                validator: (value) {
                  RegExp regex =  RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return ("Please enter your email");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Please enter a valid password of min 6 chars");
                  }
                  return null;
                },
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
                  if (_formKey.currentState!.validate()) {
                    bool shouldNavigate = await register(
                        _emailField.text,
                        _passwordField.text,
                        _nameField.text,
                        int.parse(_ageField.text));
                    // await signUp();
                    if (shouldNavigate) {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      var userID = auth.currentUser!.uid;
                      //Navigate
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetCreator(userID),
                        ),
                      );
                    }
                  } else {
                    
                  }
                },
                child: const Text("Register"),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
