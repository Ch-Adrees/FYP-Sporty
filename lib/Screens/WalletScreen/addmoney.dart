// add_money_dialog.dart

// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';

class AddMoneyDialog extends StatelessWidget {
  double currentBalance = 20000;
   final ValueSetter<double> onAddMoney;
  final TextEditingController _amountController = TextEditingController();

  AddMoneyDialog({Key? key, required this.onAddMoney}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Money'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter Amount',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _validateAndAddMoney(context),
            style: ElevatedButton.styleFrom(
              //primary: Colors.green,
            ),
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _validateAndAddMoney(BuildContext context) {
    double amount = double.tryParse(_amountController.text) ?? 0.0;

    if (amount >= 0) {
      onAddMoney(amount);
      Navigator.of(context).pop(); // Close the dialog
    } else {
      _showErrorMessage(context, 'Invalid Amount', 'Please enter a non-negative amount.');
    }
  }

  void _showErrorMessage(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
               // primary: Colors.red,
              ),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
