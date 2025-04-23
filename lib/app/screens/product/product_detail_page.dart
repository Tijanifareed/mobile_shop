import 'package:flutter/material.dart';
import 'package:online_market/app/models/product.dart';
import 'package:online_market/app/services/cart_service.dart';

import '../../models/cart_items.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final String userId = "pBeQhnBOGuuCadsHcWvg";
  final String cartId = "HjkDCI3wsu5gRAQDL6Qx";
  CartService _cartService = CartService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Details",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.product.imageUrl,
                height: 300,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 16),
             Text(
                widget.product.name ,
                style: TextStyle(fontSize: 20,),
              ),
            Row(
              children: [
                Text("Category:"),
                TextButton(onPressed: (){},
                    child: Text("${(widget.product.category.name).toString()} | Similar product from ${(widget.product.category.name).toString()}"),
                )
              ]
            ),

            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "₦${widget.product.price}",
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                    Text(
                      "₦${widget.product.price}",
                      style: TextStyle(fontSize: 20, color: Colors.black12, fontWeight: FontWeight.normal,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),



              ],
            ),


            SizedBox(height: 8),
            Text("Description: ${widget.product.description}",

            style: TextStyle(fontSize: 20),),
            Text(
              "In stock",
              style: TextStyle(
                  color: Colors.black12,
                  fontSize: 17
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 15,),
                Icon(Icons.star, color: Colors.amber,size: 15,),
                Icon(Icons.star, color: Colors.amber,size: 15,),
                Icon(Icons.star, color: Colors.amber,size: 15,),
                Icon(Icons.star, color: Colors.amber,size: 15,),
                Text("  (124 ratings)"),
                SizedBox(width: 100,),
                Icon(Icons.share, color: Colors.amber,size: 20,),
                SizedBox(width: 15,),
                Icon(Icons.heart_broken_sharp, color: Colors.amber,size: 20,),

              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final cartItem = CartItem(productId:widget.product.id, cartId: cartId, quantity: 2);
                  try {
                    if (widget.product.quantityAvailable > 0) {
                      await _cartService.addToCart(cartItem);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${widget.product
                            .name} added to cart successfully')),
                      );
                      print("Added to cart: ${widget.product.name}");
                    }else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("This item is unavaliable for mow")));
                  }catch (e){
                    print("Error: $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to add to cart')),
                    );
                  }
                },
                child: Text("Add to Cart", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     items:[
      //     ] ),
    );
  }
}
