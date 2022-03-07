import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';
import 'package:flutter_application_1/src/widgets/wrapperWidget.dart';

import 'models/pets.dart';
import 'widgets/petCreationWidget.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("whas good")),
        body: Column(
          children: [
            wrapperWidget(),
          ],
        ),
      ),
    );
  }
}
