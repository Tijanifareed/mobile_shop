import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_market/app/models/cart_items.dart';

class CartItemsRepository{
  final CollectionReference _cartItemsCollection = FirebaseFirestore.instance.collection("cart_items");

  Future<void> addCartItem(CartItem item) async{
    final docref = await _cartItemsCollection.add(item.tomap());
    final generatedId = docref.id;
    await docref.update({"id": generatedId});
    item.id  = generatedId;
  }




}