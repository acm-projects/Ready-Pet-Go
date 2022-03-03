import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';

import 'models/pets.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("whas good")),
        body: Column(
          children: [
            const MyStatefulWidget(),
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final pet_provider = PetProvider();
  String? petId;
  Pet? pet;

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Pet name',
            ),
            controller: controller1,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'pet breed',
            ),
            controller: controller2,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'pet age',
            ),
            controller: controller3,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  final name = controller1.text;
                  final breed = controller2.text;
                  final age = controller3.text;

                  pet =
                      pet_provider.initializePet("01203102", name, breed, age);
                }
              },
              child: const Text('Submit'),
            ),
          ),
          petDisplays(petId),
        ],
      ),
    );
  }
}

class petDisplays extends StatefulWidget {
  final String? petId;
  final Pet? pet;
  const petDisplays(this.petId, [this.pet]);

  @override
  _petDisplaysState createState() => _petDisplaysState();
}

class _petDisplaysState extends State<petDisplays> {
  @override
  Pet? pet = null;
  final PetProvider _petProvider = PetProvider();

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => makePet(context));
  }

  void makePet(context) async {
    pet = await _petProvider.getPet("01203102", widget.petId);
  }

  Widget build(BuildContext context) {
    return Container(
        child: Text(
      'Hello! How are you?',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ));
  }
}
