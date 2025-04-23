import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_market/app/models/cart.dart';
import 'package:online_market/app/models/product.dart';
import 'package:online_market/app/repositories/cart_repository.dart';
import 'package:online_market/app/repositories/product_repository.dart';
import 'package:online_market/app/screens/home/home.dart';
import 'app/constants/product_category.dart';
import 'app/models/user.dart';
import 'app/repositories/user_repository.dart';
import 'firebase_options.dart';


 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        home: Homepage(),
        // Scaffold(
      //     appBar: AppBar(title: const Text("Shopping App")),
      //
      // body: Center(
      //     child: ElevatedButton(
      //     onPressed: () async {
      //       final cartRepo = CartRepository();
      //       final cart = Cart(
      //             id: "cart001",
      //             userId: "user001"
      //       );
      //       await cartRepo.addCart(cart);
      //
      //       // final userRepo = UserRepository();
      //       // await userRepo.addUser(user);
      //       print("✅ Product created!");
      //     },
      //     child: const Text("Create Cart"),
      //   ),
      //
      // ),
      //     ),

        //




    );
  }
}
