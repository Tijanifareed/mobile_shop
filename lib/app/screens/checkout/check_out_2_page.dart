import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'check_out_3_page.dart';

class CheckOut2Page extends StatefulWidget {
  int allTotal;
   CheckOut2Page( this.allTotal, {super.key});

  @override
  State<CheckOut2Page> createState() => _CheckOut2PageState();
}

class _CheckOut2PageState extends State<CheckOut2Page> {

  int extractAmount(String shippingOption) {
    final regex = RegExp(r'\d+');
    final match = regex.firstMatch(shippingOption);

    if (match != null) {
      return int.parse(match.group(0)!);
    } else {
      throw FormatException("No number found in the string");
    }
  }

  // int shippingFee = extractAmount(widget.shippingOption ?? "");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Check out"), centerTitle: true, ),
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
                Icon(Icons.verified, color: Colors.black12)
              ],
            ),
            SizedBox(height: 10,),
            Text("Step 2", style: TextStyle(fontSize: 8, color: Colors.black38),),
            Text("  Payment", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Choose your card",style: TextStyle(color: Colors.black), ),
                SizedBox(width: 130,),
                Text("Add new+", style: TextStyle(color: Colors.red),),
              ],
            ),
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0xqEnxalWIVnab7XQ5kLUtgBfPYjvcCJhUA&s"),
            SizedBox(height: 60,),
            _buildRow("Product price", "\₦${widget.allTotal}"),
            Divider(height: 30, thickness: 1),
            SizedBox(height: 7),
            _buildRow("Shipping", "Home"),
            SizedBox(height: 5),
            Divider(height: 30, thickness: 1),
            _buildRow("Subtotal", "\₦${200}", isBold: true),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),
              onPressed: () {
                // Proceed to checkout logic here
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> CheckOut3Page()),
                );

              },
              child: const Text("Place my order", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),

      ),
    );
  }


  Widget _buildRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

}


