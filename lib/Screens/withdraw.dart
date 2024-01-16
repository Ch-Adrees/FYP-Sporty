

// ignore_for_file: library_private_types_in_public_api, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class WithDrawDialog extends StatefulWidget {
  const WithDrawDialog({super.key});

  @override
  _WithDrawDialogState createState() => _WithDrawDialogState();
}

class _WithDrawDialogState extends State<WithDrawDialog> {
  bool jazzCashChecked = false;
  bool easyPaisaChecked = false;
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Withdraw Account'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(signed: true,decimal: false),
            decoration: InputDecoration(hintText: 'Enter Amount',
             border: OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: jazzCashChecked,
                onChanged: (bool? value) {
                  setState(() {
                    jazzCashChecked = value ?? false;
                  });
                },
              ),
              const Text('Jazz Cash'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: easyPaisaChecked,
                onChanged: (bool? value) {
                  setState(() {
                    easyPaisaChecked = value ?? false;
                  });
                },
              ),
              const Text('Easy Paisa'),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Handle the button press event (proceed)
              // Access amountController.text for the entered amount
              // Use jazzCashChecked and easyPaisaChecked as needed
              print('Amount: ${amountController.text}');
              print('Jazz Cash Checked: $jazzCashChecked');
              print('Easy Paisa Checked: $easyPaisaChecked');
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Proceed'),
          ),
        ],
      ),
    );
  }
}