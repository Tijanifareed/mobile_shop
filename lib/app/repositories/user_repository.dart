import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class UserRepository{
  final CollectionReference _userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) async {
    final docRef = await _userCollection.add(user.toMap());
    final generatedId = docRef.id;
    await docRef.update({'id': generatedId});
    user.id = generatedId;
  }


  Future<User?> getUserById(String id) async {
    final doc = await _userCollection.doc(id).get();
    if (doc.exists) return User.fromMap(doc.data() as Map<String, dynamic>);
    else return null;
  }

}