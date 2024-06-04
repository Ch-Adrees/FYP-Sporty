import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/SellerHomeScreen/order_card.dart';
import '../../Models/order_model.dart';

class NewOrderScreen extends ConsumerStatefulWidget {
  const NewOrderScreen({super.key});
  static String routeName = "/new_orders";
  @override
  ConsumerState<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends ConsumerState<NewOrderScreen> {
  void getTheOrderFromFirebase() async {
    String sellerId = await ref.read(authServicesProvider).getUserId();
    ref
        .read(sellerOrderProvider.notifier)
        .fetchTheTotalOrdersFromTheFirebase(sellerId, context);
  }

  @override
  void initState() {
    super.initState();
    getTheOrderFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    List<OrderModel> orders = ref.watch(sellerOrderProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "New Orders",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return Ordercard(
                    order: orders[index],
                    acceptPress: () async {
                      String sellerId =
                          await ref.read(authServicesProvider).getUserId();
                      ref.read(sellerOrderProvider.notifier).acceptOrder(
                          orders[index].orderNo, sellerId, context);
                    },
                     rejectPress: () async {
                        String sellerId =
                          await ref.read(authServicesProvider).getUserId();
                      ref.read(sellerOrderProvider.notifier).rejectOrder(
                          orders[index].orderNo, sellerId, context);
                       },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
