import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_market/app/models/cart_items.dart';

import '../models/cart.dart';

class CartRepository{
  final CollectionReference _cartCollections = FirebaseFirestore.instance.collection("cart");


  Future<void> addCart(Cart cart) async{
    final docref =  await _cartCollections.add(cart.toMap());
    final generatedId = docref.id;
    await docref.update({"id": generatedId});
    cart.id = generatedId;
  }

  Future<List<CartItem>> getAUserCart(String cartId) async {
    try {
      // Fetch the cart document by cartId
      DocumentSnapshot cartDoc = await _cartCollections.doc(cartId).get();

      if (cartDoc.exists) {
        // If cart exists, convert it into a Cart object
        Map<String, dynamic> data = cartDoc.data() as Map<String, dynamic>;
        List<CartItem> cartItems = (data['cartItems'] as List)
            .map((item) => CartItem.fromMap(item))
            .toList();

        return cartItems;
      } else {
        throw Exception("Cart not found for cartId: $cartId");
      }
    } catch (e) {
      print("Error fetching cart: $e");
      rethrow; // Propagate the error
    }
  }


  Future<void> updateCart(CartItem cartItem) async {
    try {
      await _cartCollections.doc(cartItem.cartId).update({
        "cartItems": FieldValue.arrayUnion([cartItem.tomap()])
      });
      print("CartItem added to cart!");
    } catch (e) {
      print("Failed to update cart: $e");
    }
  }

  Future<void> removeCartItemByProductId(String cartId, String productIdToRemove) async {
    try {
      final docSnapshot = await _cartCollections.doc(cartId).get();
      if (!docSnapshot.exists) {
        print("Cart not found.");
        return;
      }
      final data = docSnapshot.data() as Map<String, dynamic>?;
      final List<dynamic> cartItems = (data?['cartItems'] as List<dynamic>? ?? []);
      final itemToRemove = cartItems.firstWhere(
            (item) => item['productId'] == productIdToRemove,
        orElse: () => null,
      );

      if (itemToRemove == null) {
        print("Item with productId $productIdToRemove not found in cart.");
        return;
      }

      await _cartCollections.doc(cartId).update({
        'cartItems': FieldValue.arrayRemove([itemToRemove])
      });

      print("Item removed successfully.");
    } catch (e) {
      print("Error removing item from cart: $e");
    }


    }

  // Stream<List<CartItem>> getCartItemsStream(String userId) {
  //   return _cartCollections
  //       // .collection('carts')
  //       .doc(userId)
  //       .snapshots()
  //       .map((docSnapshot) {
  //     final raw = docSnapshot.data();
  //     final data = raw != null ? Map<String, dynamic>.from(raw as Map) : {};
  //
  //     final cartItems = data['cartItems'] as List<dynamic>? ?? [];
  //
  //     return cartItems.map((item) {
  //       final map = Map<String, dynamic>.from(item as Map); // 👈 still needed here too
  //       return CartItem.fromMap(map);
  //     }).toList();
  //   });
  // }





}