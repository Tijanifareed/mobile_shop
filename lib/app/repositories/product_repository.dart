import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductRepository{
  final CollectionReference _productsCollection = FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(Product product) async {
    await _productsCollection.doc(product.id).set(product.toMap());
  }

  Future<List<Product>> getAllProducts() async {
    final querySnapshot = await _productsCollection.get();
    return querySnapshot.docs
        .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> updateProduct(Product product) async{
      await _productsCollection.doc(product.id).update(product.toMap());
  }

  Future<void> deleteProduct(String id) async {
    await _productsCollection.doc(id).delete();
  }

  Future<Product?> getProductById(String id) async{
    final doc = await _productsCollection.doc(id).get();
    if(doc.exists) return Product.fromMap(doc.data() as Map<String, dynamic>);
    else return null;
  }
}