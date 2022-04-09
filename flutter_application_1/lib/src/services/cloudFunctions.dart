// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_functions/cloud_functions.dart';

// FirebaseFunctions functions = FirebaseFunctions.instance;

// FutureOr<void> makeNamesUppercase(Change<DocumentSnapshot> change, EventContext context) {
//   // Since this is an update of the same document we must guard against
//   // infinite cycle of this function writing, reading and writing again.
//   final snapshot = change.after;
//   if (snapshot.data.getString("uppercasedName") == null) {
//     var original = snapshot.data.getString("name");
//     print('Uppercasing $original');

//     UpdateData newData = new UpdateData();
//     newData.setString("uppercasedName", original.toUpperCase());

//     return snapshot.reference.updateData(newData);
//   }
//   return null;
// }