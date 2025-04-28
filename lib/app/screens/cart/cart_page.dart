import 'package:flutter/material.dart';
import 'package:online_market/app/models/cart.dart';
import 'package:online_market/app/models/cart_items.dart';
import 'package:online_market/app/repositories/product_repository.dart';
import 'package:online_market/app/services/cart_service.dart';

import '../../models/product.dart';

class CartPage extends StatefulWidget {
  final ProductRepository productRepository;
  const CartPage({super.key,required this.productRepository});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
 CartService cartService = CartService();
 final cartId = "HjkDCI3wsu5gRAQDL6Qx";
 late Future<List<CartItem>> _cartItems;
 late int totalItems;
 late Future<List<Product?>> _productsInCart;

 @override
 void initState() {
   super.initState();
   _cartItems = printCart(cartId);
   _productsInCart = _cartItems.then((items) {
     totalItems = items.length;
     print("Cart length: ${items.length}");
     return getAllProductsInCart(items);
   });
 }







 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
       title: Text("Cart"),
       backgroundColor: Colors.white,
       elevation: 0,
     ),

      // )
      body: FutureBuilder(
        future: Future.wait([_cartItems, _productsInCart]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error loading cart"));
          }

          List<CartItem> cartItems = snapshot.data![0];
          List<Product?> products = snapshot.data![1];

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              final product = products[index];

              return Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // Product image
                      Image.network(product?.imageUrl ?? '', width: 60, height: 60, fit: BoxFit.cover),
                      SizedBox(width: 10),

                      // Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product?.name ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Category: ${product?.category.name ?? ''}", style: TextStyle(fontSize: 13)),
                            Row(
                              children: [
                                Text("₦${product?.price}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(width: 8),
                                SizedBox(width: 4),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                  // child: Text("-${product?.discount ?? 0}%", style: TextStyle(color: Colors.orange)),
                                ),
                              ],
                            ),
                            Text("In Stock", style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (){
                            _removeItemFromCart(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${product?.name} removed from cart successfully')),
                            );
                          },
                          child: Text(
                            "Remove Item",
                          style: TextStyle(
                        fontSize: 10,
                            color: Colors.white
                      ),
                      ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        )
                      ),

                      // Quantity Controls
                      Column(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.add, color: Colors.black)),
                          Text(item.quantity.toString()),
                          IconButton(onPressed: () {}, icon: Icon(Icons.remove, color: Colors.black)),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),



    );
  }

 void _handleCheckout(List<CartItem> items, List<Product?> products) {
   double total = 0;

   for (int i = 0; i < items.length; i++) {
     final product = products[i];
     final quantity = items[i].quantity;

     if (product != null && product.price is String) {
       try {
         // Remove commas from price string, parse to double
         final cleanPrice = product.price.replaceAll(',', '');
         final price = double.tryParse(cleanPrice) ?? 0.0;

         total += price * quantity!;
       } catch (e) {
         print("Failed to parse price: ${product.price}");
       }
     }
   }

   showDialog(
     context: context,
     builder: (context) => AlertDialog(
       title: Text("Checkout"),
       content: Text("Total amount: ₦${total.toStringAsFixed(2)}\nProceed to payment?"),
       actions: [
         TextButton(
           onPressed: () => Navigator.of(context).pop(),
           child: Text("Cancel"),
         ),
         ElevatedButton(
           onPressed: () {
             Navigator.of(context).pop();
             ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text("Checkout initiated")),
             );
             // Add your real checkout logic here
           },
           child: Text("Proceed"),
         ),
       ],
     ),
   );
 }

 Future<List<CartItem>> printCart(String cartId) async {
   try {
     final cartItems = await cartService.getUserCart(cartId);
     return cartItems;
   } catch (e) {
     throw Exception("No Cart Item");
   }
 }

 Future<List<Product?>> getAllProductsInCart(List<CartItem> cartItems) async {
   try {
     final futures = cartItems.map((item) {
       final id = item.productId ?? "";
       return widget.productRepository.getProductById(id);
     }).toList();
     return await Future.wait(futures);
   } catch (e) {
     throw Exception("No Cart found");
   }
 }

 void _removeItemFromCart(Product? product) async {
   await cartService.removeItemFromCart(product?.id ?? "", cartId);

   setState(() {
     _cartItems = printCart(cartId);
     _productsInCart = _cartItems.then((items) {
       totalItems = items.length;
       return getAllProductsInCart(items);
     });
   });
 }


}
