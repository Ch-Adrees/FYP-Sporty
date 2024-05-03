import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import '../Success Screen/success_screen.dart';
import 'widget/ProductItem.dart';
import 'widget/billing_amount_section.dart';

class CheckoutScreen extends StatelessWidget {
  static String routeName = "/checkoutscreen";
  final List<Map<String, dynamic>> products;
  final String fullName;
  final String mobileNumber;
  final String address;
  final String city;
  final String state;
  final String country;
  final String selectedPaymentMethodName;
  final String selectedPaymentMethodImage;

  const CheckoutScreen({
    Key? key,
    required this.fullName,
    required this.mobileNumber,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.selectedPaymentMethodName,
    required this.selectedPaymentMethodImage,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? voucherCode;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Check Out',
              style: TextStyle(
                fontSize: 26.0,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 32.0),
            _buildVoucherCodeInput(context, (value) {
              voucherCode = value;
            }),
            const SizedBox(height: 32.0),
            const BillingAmountSection(),
            const SizedBox(height: 32.0),
            const Divider(),
            const SizedBox(height: 32.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order Summary", // Added order summary text
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ...products.map((product) {
                  return ProductItem(
                    title: product['title'],
                    imageUrl: product['imageUrl'],
                    price: product['price'],
                  );
                }).toList(),
              ],
            ),
            const Divider(),
            const SizedBox(height: 32.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Align children to the start (left) side
              children: [
                const Text(
                  "Payment Method",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Row(
                  children: [
                    Image.asset(
                      selectedPaymentMethodImage,
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 13),
                    Text(selectedPaymentMethodName),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Shipping Address",
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(fullName),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.grey, size: 16),
                    const SizedBox(width: 20),
                    Text(mobileNumber),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Icon(Icons.location_history,
                    color: Colors.grey, size: 16),
                const SizedBox(width: 20),
                Expanded(child: Text('$address, $city, $state, $country')),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, SuccessScreen.routeName,
                arguments: voucherCode);
          },
          child: const Text('Place Order'),
        ),
      ),
    );
  }

  Widget _buildVoucherCodeInput(
      BuildContext context, Function(String) onChanged) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              onChanged: onChanged,
              decoration: const InputDecoration(
                hintText: "Enter Voucher Code",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {
                // Implement voucher code logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(
                  color: const Color.fromARGB(255, 10, 4, 4).withOpacity(0.1),
                ),
              ),
              child: const Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}
