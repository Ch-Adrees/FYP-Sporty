import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double currentBalance;
  final int phoneNumber;
  final VoidCallback updateBalance;

  const BalanceCard({
    Key? key,
    required this.currentBalance,
    required this.phoneNumber, required this.updateBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 242, 153, 153).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Balance',
              style: TextStyle(
                color: Color(0xFFCC5656),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '\$$currentBalance',
                    style: const TextStyle(
                      color: Color(0xFFCC5656),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(
                  Icons.account_balance_wallet,
                  color: Color(0xFFCC5656),
                  size: 28,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '$phoneNumber',
              style: const TextStyle(
                color: Color(0xFFCC5656),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void updateBalanceFromDialog(double amount) {

  }
