import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal'),
            Text('\$256.0'),
          ],
        ),
        SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee'),
            Text('\$6.0'),
          ],
        ),
         SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total'),
            Text('\$266.0'),
          ],
        ),

      ],
    );
  }
}