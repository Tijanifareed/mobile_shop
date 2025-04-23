import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_market/app/models/cart_items.dart';
import 'package:online_market/app/repositories/cart_repository.dart';

import '../repositories/cart_items_repository.dart';

class CartService{
  final _cartCollection = FirebaseFirestore.instance.collection('cart');
  final CartRepository _cartRepository = CartRepository();

    Future<void>  addToCart(CartItem cartItems) async{
      _cartRepository.updateCart(cartItems);
      print("Updated Cart");
    }

    Future<void> removeItemFromCart(String cartId, String itemId)async {

    }

}