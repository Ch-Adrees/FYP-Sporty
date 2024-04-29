import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:fyp/Features/Authentication/auth_controller.dart';
//import 'package:fyp/Features/Users/Customer/customer_service.dart';
import 'package:fyp/Features/providers.dart';
//import 'package:fyp/Features/Authentication/auth_controller.dart';
import 'package:fyp/HelperMaterial/constant.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fyp/HelperMaterial/suffixicons.dart';
import 'package:fyp/HelperMaterial/errors.dart';


class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  List<String?> errors = [];
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  // Variables We need In this form
  String? email;
  String? password;
  String? confirmPassword;
  bool _isObscure = false;
  bool _isconfirmObscure = false;
  String? selectedRole;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            obscureText: !_isObscure,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: !_isconfirmObscure,
            onSaved: (newValue) => confirmPassword = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.isNotEmpty && password == confirmPassword) {
                removeError(error: kMatchPassError);
              }
              confirmPassword = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if ((password != value)) {
                addError(error: kMatchPassError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Re-enter your password",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isconfirmObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isconfirmObscure = !_isconfirmObscure;
                    });
                  },
                )),
          ),

          // FormError(errors: errors),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(35),
            ),
            child: DropdownButton<String>(
              padding: const EdgeInsets.fromLTRB(10, 5, 0.0, 0.0),
              borderRadius: BorderRadius.circular(50),
              value: selectedRole,
              hint: const Text('Select Your Role'),
              icon: const Icon(Icons.arrow_drop_down),
              underline: Container(
                height: 0,
              ),
              iconSize: 30,
              isExpanded: true,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  selectedRole = newValue!;
                });
              },
              items: <String>['Select', 'customer', 'seller']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              //decoration: InputDecoration(
            ),
          ),

          const SizedBox(height: 20),
          FormError(errors: errors),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ref.read(authControllerProvider).registerUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                    userType: selectedRole!,
                    context: context); 
                // switch (selectedRole) {
                //   case "Seller":
                //     Navigator.pushNamed(context, SellerHomeScreen.routeName);
                //   case "customer":
                //     Navigator.pushNamed(context, HomeScreen.routeName);
                //   case "admin":
                //     Navigator.pushNamed(context, AdminPage.routeName);
                //   default:
                //}
              }
            },
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
