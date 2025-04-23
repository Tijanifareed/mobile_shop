import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_market/app/models/product.dart';

class ProductService{

  final _productCollection = FirebaseFirestore.instance.collection('products');

  Future<List<Product>> getAllProducts() async{
    try{
      final snapshot = await _productCollection.get();
      return snapshot.docs.map((doc){
        final data = doc.data();
        return Product.fromMap(data);
      }).toList();
    }catch (e) {
      print("Error fetching products: $e");
      throw Exception("Failed to fetch products");
    }
  }

}