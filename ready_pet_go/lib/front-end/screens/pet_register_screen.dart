import 'package:flutter/material.dart';
import 'package:ready_pet_go/back-end/provider_functions/pet_provider.dart';
import './home_screen.dart';
import '../../back-end/models/pet.dart';

class PetRegisterScreen extends StatefulWidget {
  final String userID;

  const PetRegisterScreen(this.userID, {Key? key}) : super(key: key);

  @override
  _PetRegisterScreenState createState() => _PetRegisterScreenState();
}

class _PetRegisterScreenState extends State<PetRegisterScreen> {
  DateTime? selectedDate;
  Pet? pet;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: const EdgeInsets.only(top: 30),
              ),
              Image.asset('lib/src/assets/images/dog_logo_transparent.png',
                  height: 250, width: 250),
              //const SizedBox(height: 10),
              const Text('Create Your Pet!',
                  textScaleFactor: 2.0,
                  style: TextStyle(color: Color(0xFF00A5E0))),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                //child: Text('Customize Your Pet'),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.border_color_outlined),
                        labelText: 'Pet Name',
                      ),
                      controller: controller1,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 50),
                    TextFormField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.cake_outlined),
                        labelText: 'Pet Breed',
                      ),
                      controller: controller2,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 50),
                    TextFormField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.pets_outlined),
                        labelText: 'Pet Age',
                      ),
                      controller: controller3,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid age';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xFF00A5E0),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      final name = controller1.text;
                      final breed = controller2.text;
                      final age = controller3.text;
                      
                      PetProvider pet_provider = PetProvider(widget.userID);

                      pet = pet_provider.initializePet(
                          widget.userID, name, breed, int.parse(age) );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(widget.userID)));

                      // await petProvider.initializePet(name, breed, int.parse(age));
                      // registerPet(widget.userID, name, breed, age);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>Home(widget.userID),
                      //   ),
                      // );
                    }
                  },
                  child: const Text('Go!',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ));
  }
}
