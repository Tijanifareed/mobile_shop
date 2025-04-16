import 'package:online_market/app/models/product.dart';

class CartItem {
  final String id;
  final String cartId;
  final String productId;
  final int quantity;

  CartItem({
    required this.id,
    required this.cartId,
    required this.productId,
    required this.quantity
  });

  Map<String, dynamic> tomap(){
    return{
      "id": id,
      "cartId": cartId,
      "productId": productId,
      "quantity" : quantity
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map){
    return CartItem(
      id: map['id'] ?? "",
      cartId: map['cartId'] ?? "",
      productId: map['productId'] ?? "",
        quantity: map['quantity'] ?? 0,
    );
  }

  CartItem copyWith({
    String? id,
    String? cartId,
    String? productId,
    int? quantity,
}){
    return CartItem(
      id: id ?? this.id,
      cartId: cartId ?? this.cartId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }



}