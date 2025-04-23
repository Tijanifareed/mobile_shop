import 'package:flutter/material.dart';
import 'package:online_market/app/models/cart.dart';
import 'package:online_market/app/models/cart_items.dart';
import 'package:online_market/app/repositories/cart_repository.dart';
import 'package:online_market/app/repositories/product_repository.dart';
import 'package:online_market/app/screens/home/home_tab.dart';
import 'package:online_market/app/screens/home/profile_page.dart';
import 'package:online_market/app/screens/home/search_page.dart';
import '../cart/cart_page.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final CartRepository repository = CartRepository();
  late Future<List<CartItem>> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems = repository.getAUserCart("HjkDCI3wsu5gRAQDL6Qx");  // Fetch cart items on init
  }

  final List<Widget> _pages = [
    HomeTab(),
    SearchPage(),
    CartPage(productRepository: ProductRepository()),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        _cartItems = repository.getAUserCart("HjkDCI3wsu5gRAQDL6Qx");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      // _selectedIndex == 2
      //     ? FutureBuilder<List<CartItem>>(
      //   future: _cartItems,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       print(_cartItems);
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       print(_cartItems);
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return Center(child: Text('No items in your cart.'));
      //     } else {
      //       return CartPage(
      //         cartItems: snapshot.data!, // Pass the list of cart items
      //         productRepository: ProductRepository(),
      //       );
      //     }
      //   },
      // )

      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
