import 'package:online_market/app/models/cart.dart';

import 'cart_items.dart';

class Orders{
  String? id;
  final String userId;
  final List<CartItem> items;
  final double totalAmount;
  final DateTime createdAt;

  Orders({
    this.id,
    required this.userId,
    required this.items,
    required this.totalAmount,
    required this.createdAt,
  });

  Map<String, dynamic> toMap(){
    return{
      "id": id,
      "userId": userId,
      "items": items,
      "totalAmount": totalAmount,
      "createdAt": createdAt,
    };
  }

  factory Orders.fromMap(Map<String, dynamic> map){
    return Orders(
      id: map["id"] ?? "",
      userId: map["userId"] ?? "",
      items: map["items"] ?? "",
      totalAmount: (map["totalAmount"] ?? 0).toDouble(),
      createdAt: map["createdAt"] ?? "",
    );

  }

  Orders copyWith({
    String? id,
    String? userId,
    List<CartItem>? items,
    double? totalAmount,
    DateTime? createdAt,

  }){
    return Orders(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        items: items ?? this.items,
        totalAmount: totalAmount ?? this.totalAmount,
        createdAt: createdAt ?? this.createdAt,
    );
}


}