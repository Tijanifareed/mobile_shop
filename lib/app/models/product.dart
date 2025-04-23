import 'package:online_market/app/constants/product_category.dart';

class Product{
  String? id;
  String name;
  String price;
  String imageUrl;
  ProductCategory category;
  String description;
  final int quantityAvailable;



  Product({
     this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.description,
    required this.quantityAvailable
});

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "price": price,
      "imageUrl": imageUrl,
      "category": category.name,
      "description": description,
      "quantityAvailable": quantityAvailable,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map){
    return Product(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      price: map["price"] ?? "",
        category: ProductCategory.values.byName(map['category']),
      imageUrl: map["imageUrl"] ?? "",
      description: map["description"] ?? "",
      quantityAvailable: map["quantityAvailable"] ?? 0

    );
  }


  Product copyWith({
    String? id,
    String? name,
    String? price,
    String? imageUrl,
    String? description,
    int? quantityAvailable,
    ProductCategory? category
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      category: category?? this.category,
      quantityAvailable: quantityAvailable ?? this.quantityAvailable,
    );
  }



}