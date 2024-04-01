

// ignore_for_file: library_private_types_in_public_api, duplicate_ignore, duplicate_ignore, prefer_const_constructors, sized_box_for_whitespace, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:fyp/Screens/WalletScreen/balancecard.dart';
import 'package:fyp/Screens/WalletScreen/walletbutton.dart';
import '../../HelperMaterial/constant.dart';
import 'addmoney.dart' show AddMoneyDialog;
import 'withdraw.dart' show WithDrawDialog;



class WalletScreen extends StatefulWidget {
  static String routeName = '/wallet';

  const WalletScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double currentBalance = 20000;
  void updateBalance(double amount) {
    setState(() {
      currentBalance += amount;
    });
  }// Initial balance value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wallet',
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Account Overview',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFCC5656),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFFCC5656),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.stacked_bar_chart_rounded),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: Expanded(
                  child: PageView(
                    children: [
                      BalanceCard(
                        currentBalance: currentBalance,
                        phoneNumber: 03001234567,
                        updateBalance: () {
                          // Empty for now, you can add logic here if needed
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WalletButtons(
                      iconPath: 'assets/icons/Plus Icon.svg',
                      textButton: 'Add',
                      press: () {
                       showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddMoneyDialog(
                onAddMoney: (double amount) {
                  // Call the updateBalance function to update the current balance in BalanceCard
                  updateBalance(amount);
                },
              );
            },
          );
        },
      ),
      SizedBox(height: 40,),
                    WalletButtons(
                      iconPath: 'assets/icons/cash-withdraw-thin.svg',
                      textButton: 'WithDraw',
                      press: () {
                        showDialog(
              context: context,
              builder: (context) {
                return const WithDrawDialog();
              },
            );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
