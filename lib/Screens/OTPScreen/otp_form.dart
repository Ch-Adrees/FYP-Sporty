import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/suffixicons.dart';
import 'package:fyp/Screens/OTPScreen/otp_screen.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      //key: _formKey,
      child: Column(children: [
        TextFormField(
          keyboardType: TextInputType.number,
          //     onSaved: (newValue) => email = newValue,
          // onChanged: (value) {
          // if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          // setState(() {
          // errors.remove(kEmailNullError);
          // });
          // } else if (emailValidatorRegExp.hasMatch(value) &&
          // errors.contains(kInvalidEmailError)) {
          // setState(() {
          // errors.remove(kInvalidEmailError);
          // });
          // }
          // return;
          // },
          // validator: (value) {
          // if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          // setState(() {
          // errors.add(kEmailNullError);
          // });
          // } else if (!emailValidatorRegExp.hasMatch(value) &&
          // !errors.contains(kInvalidEmailError)) {
          // setState(() {
          // errors.add(kInvalidEmailError);
          // });
          // }
          // return null;
          // },
          decoration: const InputDecoration(
            labelText: "OTP",
            hintText: "Enter OTP",
            // If  you are using latest version of flutter then lable text and hint text shown like this
            // if you r using flutter less then 1.20.* then maybe this is not working properly
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/Lock.svg"),
          ),
        ),
        //const SizedBox(height: 8),
        //FormError(errors: errors),
        const SizedBox(height: 35),
        ElevatedButton(
          onPressed: () {
            //if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, OtpScreen.routeName);
            //}
          },
          child: const Text("Verify"),
        ),
      ]),
    );
  }
}
