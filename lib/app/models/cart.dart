import 'package:online_market/app/models/cart_items.dart';

class Cart{
  String? id;
  final String userId;
  List<CartItem>? cartItems;

  Cart({
    this.id,
    required this.userId,
    this.cartItems,
  });

  Map<String, dynamic> toMap(){
    return{
      "id": id,
      "userId": userId,
      "cartItems": cartItems,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map){
    return Cart(
        id: map["id"] ?? "",
        userId: map["userId"] ?? "",
        cartItems: map["cartItems"] ?? "",
    );
  }

  Cart copyWith({
    String? id,
    String? userId,
    List<CartItem>? cartItems,
  }){
    return Cart(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      cartItems: cartItems ?? this.cartItems,
    );
    }


}