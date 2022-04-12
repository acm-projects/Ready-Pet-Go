import 'package:flutter/material.dart';

// importing material design library
// void main() {
// runApp(MaterialApp(
// 	theme: ThemeData(fontFamily: 'Nunito'),
// 	// runApp method
// 	home: HomePage(),
// )); //MaterialApp
// }

// Creating a stateful widget to manage
// the state of the app
class TaskList extends StatefulWidget {
@override
_TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

// value set to false
bool _value = false;
bool _value2 = false;
bool _value3 = false;
bool _value4 = false;
bool _value5 = false;


// App widget tree
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
    backgroundColor: Colors.white,
		appBar: AppBar(
      centerTitle: true,
		title: Padding(
		  padding: const EdgeInsets.only(left: 0.0),
		  child: Text('TO-DO LIST', style: TextStyle(color: Colors.black, fontFamily: 'Nunito', fontWeight: FontWeight.w700, fontSize: 30)),
    ),
		backgroundColor: Colors.white,
    elevation: 0,
		leading: IconButton(
			icon: Icon(Icons.arrow_back_sharp, color: Colors.black,),
			tooltip: 'Menu',
			onPressed: () {},
		), //IconButton
		), //AppBar
		body: Center(
		child: SizedBox(
			width: 800,
			height: 800,
			child: Center(
			child: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
				children: [
					SizedBox(
					height: 30,
					),
					Container(
					decoration: BoxDecoration(
						border: Border.all(color: Color(0xFF00A5E0)),
						//borderRadius: BorderRadius.circular(20),
					), //BoxDecoration
					
					/** CheckboxListTile Widget **/
					child: CheckboxListTile(
						title: const Text('Feed Buddy Breakfast', style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w700,)),
					//	subtitle: const Text(
							//'A computer science portal for geeks. Here you will find articles on all the technologies.'),
						secondary: CircleAvatar(
              backgroundColor: Colors.white,
						//backgroundImage: 
              //backgroundColor: Colors.white,
            //(Icons.calculate, size: 55),
              backgroundImage: AssetImage('assets/images/tempfood2.png'),
            //NetworkImage(
						//	"https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
						radius: 20,
            
						),
						autofocus: false,
						//isThreeLine: true,
						activeColor: Colors.white,
						checkColor: Color(0xFF82B26C),
            selectedTileColor: Color(0xFF82B26C),
						selected: _value,
						value: _value,
						onChanged: (value) {
              
						setState(() {
							_value = value!;
						});
						},
					), //CheckboxListTile
					),
          SizedBox(
					height: 30,
					),
					Container(
					decoration: BoxDecoration(
						border: Border.all(color: Color(0xFF00A5E0)),
						//borderRadius: BorderRadius.circular(20),
            
					), //BoxDecoration

					child: CheckboxListTile(
						title: const Text('Take Buddy on a Walk', style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w700)),
						secondary: CircleAvatar(
              backgroundColor: Colors.white,
						backgroundImage: AssetImage('assets/images/tempwalk.png'),//NetworkImage
						radius: 20,
						),
						autofocus: false,
						activeColor: Colors.white,
						checkColor: Color(0xFF82B26C),
            selectedTileColor: Color(0xFF82B26C),
						selected: _value2,
						value: _value2,
						onChanged: (value) {
						setState(() {
							_value2 = value!;
						});
						},
					), //CheckboxListTile
					),
          SizedBox(
					height: 30,
					),
					Container(
					decoration: BoxDecoration(
						border: Border.all(color: Color(0xFF00A5E0)),
						//borderRadius: BorderRadius.circular(20),
					), //BoxDecoration

					child: CheckboxListTile(
						title: const Text('Play with Buddy', style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w700)),
						secondary: CircleAvatar(
              backgroundColor: Colors.white,
						backgroundImage: AssetImage('assets/images/temptoy.png'), //NetworkImage
						radius: 20,
						),
						autofocus: false,
						activeColor: Colors.white,
						checkColor: Color(0xFF82B26C),
            selectedTileColor: Color(0xFF82B26C),
						selected: _value3,
						value: _value3,
						onChanged: (value) {
						setState(() {
							_value3 = value!;
						});
						},
					), //CheckboxListTile
					),
          SizedBox(
					height: 30,
					),
					Container(
					decoration: BoxDecoration(
						border: Border.all(color: Color(0xFF00A5E0)),
						//borderRadius: BorderRadius.circular(20),
					), //BoxDecoration

					child: CheckboxListTile(
						title: const Text('Give Buddy Water', style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w700)),
						secondary: CircleAvatar(
              backgroundColor: Colors.white,
						backgroundImage: AssetImage('assets/images/tempwater2.png'),//NetworkImage
						radius: 20,
						),
						autofocus: false,
						activeColor: Colors.white,
						checkColor: Color(0xFF82B26C),
            selectedTileColor: Color(0xFF82B26C),
						selected: _value4,
						value: _value4,
						onChanged: (value) {
						setState(() {
							_value4 = value!;
						});
						},
					), //CheckboxListTile
					),
          SizedBox(
					height: 30,
					),
					Container(
					decoration: BoxDecoration(
						border: Border.all(color: Color(0xFF00A5E0)),
						//borderRadius: BorderRadius.circular(20),
					), //BoxDecoration

					child: CheckboxListTile(
						title: const Text('Feed Buddy Dinner', style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w700)),
						secondary: CircleAvatar(
              backgroundColor: Colors.white,
						backgroundImage: AssetImage('assets/images/tempfood2.png'), //NetworkImage
						radius: 20,
						),
						autofocus: false,
						activeColor: Colors.white,
						checkColor: Color(0xFF82B26C),
            selectedTileColor: Color(0xFF82B26C),
						selected: _value5,
						value: _value5,
						onChanged: (value) {
						setState(() {
							_value5 = value!;
						});
						},
					), //CheckboxListTile
					),
				],
				), //Container
			), //Padding
			), //Center
		),
		), //SizedBox
	),
	debugShowCheckedModeBanner: false, //Scaffold
	); //MaterialApp
}
}
