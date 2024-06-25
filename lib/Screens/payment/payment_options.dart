import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/cart_model.dart';

class PaymentOptionItem extends StatelessWidget {
  final String paymentMethod;
  final String label;
  final bool isSelected;
  final Function(String) onChanged;
  final String logo;
  final Color? color;
  final double width;

  const PaymentOptionItem({
    super.key,
    required this.paymentMethod,
    required this.label,
    required this.isSelected,
    required this.onChanged,
    required this.logo,
    this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(width: 1, color: Colors.black)
            : Border.all(width: 0.3, color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Radio(
                  activeColor: Colors.blue,
                  value: paymentMethod,
                  groupValue: isSelected ? paymentMethod : null,
                  onChanged: (value) {
                    onChanged(value.toString());
                  },
                ),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: const TextStyle(
                      color: kTextColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "mulish"),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              width: width,
              child: SvgPicture.asset(
                logo,
                // ignore: deprecated_member_use
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOption extends ConsumerStatefulWidget {
  final List<CartModel> list;
  const PaymentOption({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends ConsumerState<PaymentOption> {
  String selectedPayment = "easypaisa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Options",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                PaymentOptionItem(
                  width: 110,
                  color: Colors.green,
                  paymentMethod: "easypaisa",
                  label: "Pay via Easypaisa",
                  isSelected: selectedPayment == "easypaisa",
                  logo: "assets/icons/Easypaisa logo.svg",
                  onChanged: (value) {
                    setState(() {
                      selectedPayment = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                PaymentOptionItem(
                  width: 70,
                  paymentMethod: "cardpayment",
                  label: "Pay via Card",
                  logo: "assets/icons/card_payment (1).svg",
                  isSelected: selectedPayment == "cardpayment",
                  onChanged: (value) {
                    setState(() {
                      selectedPayment = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                PaymentOptionItem(
                  width: 70,
                  paymentMethod: "cod",
                  label: "Pay on Delievery",
                  logo:
                      "assets/icons/money-notes-receiving-dollar-color-icon(3).svg",
                  isSelected: selectedPayment == "cod",
                  onChanged: (value) {
                    setState(() {
                      selectedPayment = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                PaymentOptionItem(
                  width: 65,
                  paymentMethod: "wallet",
                  label: "Pay via Wallet",
                  logo: "assets/icons/google-wallet-icon.svg",
                  isSelected: selectedPayment == "wallet",
                  onChanged: (value) {
                    setState(() {
                      selectedPayment = value;
                    });
                  },
                )

                // Add more PaymentOptionItem widgets as needed
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 120,
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total :",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Text(
                  ref.watch(cartProvider.notifier).totalAmount().toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: () async {
                ref
                    .read(orderProvider.notifier)
                    .makeOrder(widget.list, context, ref);
              },
              style: ElevatedButton.styleFrom(elevation: 1),
              child: const Text("Place Order"),
            ),
          )
        ]),
      ),
    );
  }
}
