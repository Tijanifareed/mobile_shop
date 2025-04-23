import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_market/app/screens/checkout/check_out_2_page.dart';

class CheckOutPage extends StatefulWidget {
  int allTotal;

   CheckOutPage(this.allTotal, {super.key});
  // const CheckOutPage({Key? key, required this.allTotal}) : super(key: key);


  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedState;
  String? shippingOption;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _streetNameController = TextEditingController();
  final TextEditingController _cityNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final List<String> nigerianStates = [
    "Abia",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nasarawa",
    "Niger",
    "Ogun",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara",
    "Federal Capital Territory (FCT)"
  ];
  final List<String> shippingMethod = [
    "₦ 2000 Delivery to Nearest Area",
    "₦ 3000 Delivery To Home",
    "₦ 5000 Fast Delivery"
  ];


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
                  Icon(Icons.credit_card, color: Colors.black12),
                  Text(" .............. ", style: TextStyle(fontSize: 20,color: Colors.black12)),
                  Icon(Icons.verified, color: Colors.black12)
                ],
              ),
              SizedBox(height: 10,),
              Text("Step 1", style: TextStyle(fontSize: 8, color: Colors.black38),),
              Text("  Shipping", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(labelText: 'First name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height:10),
                      TextFormField(
                        controller: _secondNameController,
                        decoration: InputDecoration(labelText: 'Last name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height:10),
                      TextFormField(
                        controller: _streetNameController,
                        decoration: InputDecoration(labelText: 'Street name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Street name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height:10),
                      TextFormField(
                        controller: _cityNameController,
                        decoration: InputDecoration(labelText: 'City name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your city name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height:10),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(labelText: 'Phone number'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height:10),
                      DropdownButton<String>(
                        hint: Text("Select Your state"),
                          value: _selectedState,
                          items: nigerianStates.map((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                              child: Text(value),
                                );
                          }).toList(),
                          onChanged: (String? newValue){
                            setState(() {
                              _selectedState = newValue;
                            });
                          }),
                      DropdownButton<String>(
                        hint: Text("Shipping Method"),
                          value: shippingOption,
                          items: shippingMethod.map((String values) {
                            return DropdownMenuItem<String>(
                              value: values,
                              child: Text(values),
                            );
                          }).toList(),
                          onChanged: (String? newValue){
                            setState(() {
                              shippingOption = newValue;
                            });
                          })

                    ],
                  )),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black
                ),
                onPressed: () {
                  // Proceed to checkout logic here
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> CheckOut2Page(widget.allTotal)),
                  );

                },
                child: const Text("Continue to payment", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),

      ),
    );
  }
}


