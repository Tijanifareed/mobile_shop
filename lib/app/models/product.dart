class Product{
  String id;
  String name;
  double price;
  String imageUrl;
  String description;
  final int quantityAvailable;



  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.quantityAvailable
});

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "price": price,
      "imageUrl": imageUrl,
      "description": description,
      "quantityAvailable": quantityAvailable,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map){
    return Product(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      price: (map["price"] ?? 0).toDouble(),
      imageUrl: map["imageUrl"] ?? "",
      description: map["description"] ?? "",
      quantityAvailable: map["quantityAvailable"] ?? 0

    );
  }


  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? imageUrl,
    String? description,
    int? quantityAvailable,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      quantityAvailable: quantityAvailable ?? this.quantityAvailable,
    );
  }



}