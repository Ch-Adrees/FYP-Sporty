import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';

class WrappeScreen extends ConsumerWidget {
  const WrappeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authControllerProvider).checkUserLogedIn(context: context);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sporty",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 30,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Spinner-3.gif"),
                fit: BoxFit.cover,
              ), // Semi-transparent white color
            ),
          )

        ],
      )),
    );
  }
}
