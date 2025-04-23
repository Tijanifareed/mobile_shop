import 'package:flutter/material.dart';
import 'package:online_market/app/repositories/product_repository.dart';
import 'package:online_market/app/screens/checkout/check_out_page.dart';
import '../../models/cart_items.dart';
import '../../models/product.dart';

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems;
  final ProductRepository _productRepository;

  const CartPage({
    required this.cartItems,
    required ProductRepository productRepository,
    super.key,
  }) : _productRepository = productRepository;

  @override
  Widget build(BuildContext context) {
    int allTotal = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title:  Text('Cart'), centerTitle: true, backgroundColor: Colors.white,),
      body: FutureBuilder<List<CartProductView>>(
        future: _loadCartProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Cart is empty'));
          }

          final cartViews = snapshot.data!;
          final total = cartViews.fold(0, (sum, item) {
            if (item.product == null) return sum;
            final product = item.product!;
            return sum + (_parsePrice(product.price) * item.quantity);
          });
          allTotal = total;
          print(allTotal);

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartViews.length,
                  itemBuilder: (context, index) {
                    final item = cartViews[index];
                    final product = item.product;

                    if (product == null) {
                      return const ListTile(
                        title: Text("Product not found"),
                        subtitle: Text("This product may have been removed."),
                        trailing: Text("₦0.00"),
                      );
                    }

                    final price = _parsePrice(product.price);
                    final totalForItem = price * item.quantity;

                    return ListTile(
                      leading: Image.network(
                        product.imageUrl ?? '',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.name ?? ''),
                      subtitle: Text("Quantity: ${item.quantity}"),
                      trailing: Text("₦${totalForItem.toString()}"),
                    );

                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total:",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "₦${total.toString()}",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black
                        ),
                        onPressed: () {
                          // Proceed to checkout logic here
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> CheckOutPage(allTotal)),
                          );

                        },
                        child: const Text("Proceed to checkout", style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Future<List<CartProductView>> _loadCartProducts() async {
    List<CartProductView> views = [];
    for (final cartItem in cartItems) {
      final product = await _productRepository.getProductById(cartItem.productId ?? "");
      views.add(CartProductView(product: product, quantity: cartItem.quantity ?? 0));
    }
    return views;
  }

  int _parsePrice(String? priceString) {
    if (priceString == null || priceString.isEmpty) return 0;
    final cleaned = priceString.replaceAll(",", "");
    return int.tryParse(cleaned) ?? 0;
  }
}



class CartProductView {
  final Product? product;
  final int quantity;

  CartProductView({required this.product, required this.quantity});
}
