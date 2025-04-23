import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order.dart';

class OrderRepository{

  final CollectionReference _orderCollection = FirebaseFirestore.instance.collection('order');

  Future<void> addOrder(Orders order) async{
    await _orderCollection.doc(order.id).set(order.toMap());
  }




}