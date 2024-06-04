import 'package:flutter/material.dart';
import 'package:fyp/Models/order_model.dart';
import 'package:fyp/Screens/SellerHomeScreen/order_items.dart';
import 'package:intl/intl.dart';

class Ordercard extends StatelessWidget {
  const Ordercard(
      {super.key,
      required this.order,
      required this.acceptPress,
      required this.rejectPress});
  final OrderModel order;
  final GestureTapCallback acceptPress;
  final GestureTapCallback rejectPress;
  String formateData() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    String formtedDate = formatter.format(order.orderDateTime);
    return formtedDate; // Define the format
  }

  double calculateTheTotalAmount() {
    double totalAmount = 0.0;
    if (order.orderedItems.isNotEmpty) {
      for (int i = 0; i < order.orderedItems.length; i++) {
        totalAmount += order.orderedItems[i].quantity *
            order.orderedItems[i].product.price;
      }
    } else {
      totalAmount = 0;
    }
    return totalAmount.ceilToDouble();
  }

  @override
  Widget build(BuildContext context) {
    double totalBill = calculateTheTotalAmount();
    String formatedDate = formateData();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kDefaultIconLightColor.withOpacity(0.6),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Number",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Order date ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.orderNo.toString(),
                    style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFFCC5656),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    formatedDate,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFFCC5656),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Customer Address:",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    maxLines: 4,
                    order.customerModel.address,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFFCC5656),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.orderedItems.length,
                itemBuilder: ((context, index) {
                  return OrderItems(cartedItem: order.orderedItems[index]);
                })),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "customer Name:",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 8, 8, 8),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      order.customerModel.nameOfUser,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFFCC5656),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Total Bill ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(244, 14, 13, 13),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      totalBill.toString(),
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFFCC5656),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 10, 5.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 35,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: acceptPress,
                      child: const Text(
                        "Accept",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: rejectPress,
                      child: const Text(
                        "Reject",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
