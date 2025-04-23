import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_market/app/models/cart_items.dart';

class CartItemService{
  final _cartItemsCollection = FirebaseFirestore.instance.collection('products');

  Future<void> addItemToCart(CartItem cartItem) async{

  }

}