import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';
import 'package:flutter_application_1/src/widgets/wrapperWidget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/pets.dart';

class petCreator extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final pet_provider = PetProvider();

  String? petId;
  Pet? pet;

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              hintText: 'Pet breed',
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
              hintText: 'Pet age',
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
                  //ref.read(petStateProvider.notifier).state = pet;
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
