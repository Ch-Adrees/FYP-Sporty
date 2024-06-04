import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/providers.dart';
import '/HelperMaterial/constant.dart';
import '/HelperMaterial/errors.dart';
import 'package:fyp/HelperMaterial/suffixicons.dart';
import 'package:fyp/Screens/ForgetPassword/forget_password_screen.dart';

class SigninForm extends ConsumerStatefulWidget {
  const SigninForm({super.key});

  @override
  ConsumerState<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends ConsumerState<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = false;
  bool isLoading = false;

  final List<String?> errors = [];

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
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
              return;
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
                //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
          const SizedBox(height: 10),
          Row(
            children: [
              //     Checkbox(
              //       value: remember,
              //       activeColor: kPrimaryColor,
              //       onChanged: (value) {
              //         setState(() {
              //           remember = value;
              //         });
              //       },
              //     ),
              //     const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, ForgetPassScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: kPrimaryColor),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () async {
              isLoading = true;
              setState(() {});
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (email == "chadreeswarriach@gmail.com" &&
                    password == "adrees123") {
                  //Navigator.pushNamed(context, routeName);
                } else {
                  await ref.watch(authControllerProvider).loginUser(
                      email: _emailController.text.toString(),
                      password: _passwordController.text,
                      context: context);
                }
                isLoading = false;
                setState(() {});

                // if all are valid then go to success screen
                //KeyboardUtil.hideKeyboard(context);
              }
            },
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
