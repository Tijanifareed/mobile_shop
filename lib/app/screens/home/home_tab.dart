import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../product/product_detail_page.dart';
import '../../services/product_service.dart';


class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // List of categories
  final List<String> categories = [
    'All', 'Appliances', 'Phones', 'Beauty', 'Home', 'Office', 'Electronics', 'Fashion', 'Supermarket', 'Computing', 'Gaming', 'Baby'
  ];
  final ProductService _productService = ProductService();
  List<Product> products = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try{
      final result = await _productService.getAllProducts();
      setState(() {
        products = result;
        isLoading = false;
      });
    }catch (e){
      print("Fetch error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 48),
                Expanded(
                  child: Center(
                    child: Text(
                      "Realmart",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.notifications_none, color: Colors.black, size: 30),
                  onPressed: () {
                    print("Notifications tapped");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Image.network(
                  "https://ng.jumia.is/cms/0-0-black-friday/2024/Thumbnails/BUY-2_updated.gif",
                  fit: BoxFit.cover,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Text("Failed to load banner");
                  },
                )
              ),
              SizedBox(height: 2),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print(category);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              // GridView for products
              GridView.builder(
                shrinkWrap: true, // Important to allow GridView to work inside SingleChildScrollView
                physics: NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 7,),
                          AspectRatio(
                            aspectRatio: 1.2,

                            child: Expanded(child: Image.network(
                              product.imageUrl,
                            ),),
                          ),
                          SizedBox(height: 7,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.name,
                              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "\₦${product.price}",
                              style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}