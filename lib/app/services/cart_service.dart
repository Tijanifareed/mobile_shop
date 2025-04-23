import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_market/app/models/cart_items.dart';
import 'package:online_market/app/repositories/cart_repository.dart';

import '../models/cart_items.dart';
import '../repositories/cart_items_repository.dart';

class CartService{
  final _cartCollection = FirebaseFirestore.instance.collection('cart');
  final CartRepository _cartRepository = CartRepository();

    Future<void>  addToCart(CartItem cartItems) async{
      _cartRepository.updateCart(cartItems);
      print("Updated Cart");
    }

    Future<List<CartItem>> getUserCart(String cartId) async{
      try{
        final docSnapshot = await _cartCollection.doc(cartId).get();

        if(!docSnapshot.exists){
          return [];
        }
        final data = docSnapshot.data();
        if (data == null || !data.containsKey('cartItems')){
          return [];
        }

        final List<dynamic> items = data['cartItems'];
        return items.map((e) => CartItem.fromMap(e)).toList();
      }catch(e){
        throw Exception("Failed to fetch cart: $e");

      }
    }



}