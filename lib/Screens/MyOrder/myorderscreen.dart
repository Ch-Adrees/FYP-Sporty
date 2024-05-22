// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';

import 'myorderitem.dart';

class MyOrder extends StatelessWidget {
  static const String routeName = '/myorder';

  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Order',
            style: TextStyle(
              fontSize: 26.0,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: OrderBody(orderItems: orderItems),
    );
  }
}

class OrderBody extends StatelessWidget {
  final List<OrderItem> orderItems;

  const OrderBody({super.key, required this.orderItems});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderItems.length,
      itemBuilder: (context, index) =>
          MyCardClass(orderItem: orderItems[index]),
    );
  }
}

class OrderItem {
  final String productName;
  final String productImage;
  final String orderNumber;
  final String price;
  final String deliveryStatus;
  final String orderDate;

  OrderItem({
    required this.productName,
    required this.productImage,
    required this.orderNumber,
    required this.price,
    required this.deliveryStatus,
    required this.orderDate,
  });
}

class MyCardClass extends StatelessWidget {
  final OrderItem orderItem;

  const MyCardClass({Key? key, required this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.green; // Default color for delivered status

    // Customize status color based on delivery status
    switch (orderItem.deliveryStatus) {
      case 'Delivered':
        statusColor = Colors.green;
        break;
      case 'In Transit':
        statusColor = Colors.orange;
        break;
      case 'Pending':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }
    
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color.fromARGB(255, 242, 153, 153).withOpacity(0.3),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  orderItem.productImage,
                  width: 90,
                  height: 90,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderItem.orderNumber,
                      style: const TextStyle(
                          fontSize: 18, color: Color(0xFFCC5656)),
                    ),
                    Text(
                      'Price ${orderItem.price}',
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFFCC5656)),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: statusColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      orderItem.deliveryStatus,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: ${orderItem.orderDate}',
                  style:
                      const TextStyle(fontSize: 18, color: Color(0xFFCC5656)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFCC5656),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Check Details',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
