import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class UserRepository{
  final CollectionReference _userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) async {
    await _userCollection.doc(user.id).set(user.toMap());
  }



}