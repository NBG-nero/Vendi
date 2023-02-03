import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseService {
  CollectionReference homeBanner = FirebaseFirestore.instance.collection('homeBanner');
  
  // final db = FirebaseFirestore.instance;
  // addUser(_name, _email) async {
  //   await db.collection('userData');
  //   return users.add({
  //     'name': _name,
  //     'email': _email,
  //   });
  // }
}
