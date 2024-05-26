// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/OrderCheckout/checkout.dart';

class ShippingAndPaymentScreen extends StatefulWidget {
  static String routeName = "/shippingandpaymentscreen";

  const ShippingAndPaymentScreen({Key? key}) : super(key: key);

  @override
  _ShippingAndPaymentScreenState createState() =>
      _ShippingAndPaymentScreenState();
}

class _ShippingAndPaymentScreenState extends State<ShippingAndPaymentScreen> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _zipCode = TextEditingController();
  final TextEditingController _country = TextEditingController();

  String selectedPaymentMethodName = ''; // Updated variable name
  String selectedPaymentMethodImage = ''; // Updated variable name

  final List<Map<String, String>> paymentMethods = [
    {
      'name': 'Jazz Cash',
      'image': 'assets/images/JazzCash.png',
    },
    {
      'name': 'Easy Paisa',
      'image': 'assets/images/easypaisa.jpg',
    },
    {
      'name': 'App Wallet',
      'image': 'assets/images/wallet.png',
    },
    {
      'name': 'Cash on Delivery',
      'image': 'assets/images/cod.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipping & Payment',
            style: TextStyle(
              fontSize: 26.0,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Add Shipping Details',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _fullName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Full Name",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _mobileNumber,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mobile Number",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _address,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Address",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _country,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Country",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _state,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "State/Province",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _city,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "City",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _zipCode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Zip Code(Postal Code)",
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Select Payment Method',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    final paymentMethod = paymentMethods[index];
                    return RadioListTile<String>(
                      value: paymentMethod['name']!,
                      groupValue:
                      selectedPaymentMethodName, // Updated variable name
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethodName =
                          value!; // Updated variable name
                          selectedPaymentMethodImage =
                          paymentMethod['image']!; // Update image variable
                        });
                      },
                      title: Row(
                        children: [
                          Image.asset(
                            paymentMethod['image']!,
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 8),
                          Text(paymentMethod['name']!),
                        ],
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Navigate to the Checkout Screen and pass data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutScreen(
                          fullName: _fullName.text,
                          mobileNumber: _mobileNumber.text,
                          address: _address.text,
                          city: _city.text,
                          state: _state.text,
                          country: _country.text,
                          selectedPaymentMethodName:
                              selectedPaymentMethodName, // Pass selected payment method name
                          selectedPaymentMethodImage:
                              selectedPaymentMethodImage,
                          products: [], // Pass selected payment method image
                        ),
                      ),
                    );
                  },
                  child: const Text('Next'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
