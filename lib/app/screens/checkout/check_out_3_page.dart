import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_market/app/screens/home/home.dart';

import '../../components/order_complete_gif.dart';
class CheckOut3Page extends StatefulWidget {
  const CheckOut3Page({super.key});

  @override
  State<CheckOut3Page> createState() => _CheckOut3PageState();
}

class _CheckOut3PageState extends State<CheckOut3Page> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Check out"), centerTitle: true, backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.location_solid, color: Colors.black,),
                Text(" .............. ", style: TextStyle(fontSize: 20, color: Colors.black12),),
                Icon(Icons.credit_card, color: Colors.black),
                Text(" .............. ", style: TextStyle(fontSize: 20,color: Colors.black12)),
                Icon(Icons.verified, color: Colors.black)
              ],

            ),
            SizedBox(height: 45,),
            Text("  Order Completed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
            SizedBox(height: 40,),
            // Icon(Icons.shopping_bag, ),
            GifVideoPlayer(videoUrl:"https://cdnl.iconscout.com/lottie/premium/thumb/verified-payment-shopping-cart-animated-icon-download-in-lottie-json-gif-static-svg-file-formats--approved-successful-pack-e-commerce-icons-8410040.mp4"),
            // Image.network("https://d1jj76g3lut4fe.cloudfront.net/processed/filter/thumb/7331LqtdtDnoM73av3.mp4?Expires=1745325584&Signature=WHcUSnPdZf6x9iUSfheD9ktoqNTtWG9YjsGG2lMN9r4Ol~oV2GPIcYF-1CiKKymIr9BvOOcp~F9orfGiq45nOeavw5QmrQWi8kvLmsA5p1vyDBaDus6p6y9vhU~2jbdW7Yqajk~fzkjrz6Za9TCm0SC1ubhXh~aD7Bonp6u787EHg1z~WGTOJa1liDIMJIJXJsSw7zYkkrtZYZuLLVrSAwiCy99KIsBiXhstnDQ2vmRT-HPG-vI2MX0Xy1b9rG4QzoXk8zUgyRgFIyNrgfASY91wGreRYsMSZrl-EJzVua7IUkmXnfFPTT~1py34qmcQsJ-g9a-Fw3tT8xr8qrJeBA__&Key-Pair-Id=K2YEDJLVZ3XRI#t=0.001"),
            SizedBox(height: 20),
            Text("Thanks for your purchase", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),
              onPressed: () {
                // Proceed to checkout logic here
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Homepage()),
                );

              },
              child: const Text("Continue Shopping!", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),

      ),
    );
  }



}
