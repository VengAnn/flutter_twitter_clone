import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/components/textformfield_reusable_widget.dart';
import 'package:twitter_clone/screens/register_screen.dart';

import '../constants/constant.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/icons/icons8-lock.gif',
                    height: 100,
                    fit: BoxFit.cover,
                    // color: Colors.blue,
                  ),
                  kSizedBox15,
                  Text(
                    'Welcome to login screen'.toUpperCase(),
                    style: kTitleTextStyle,
                  ),
                  kSizedBox20,
                  TextFormFieldReusableWidget(
                    lableText: "Email",
                    hintText: "Email",
                    controller: emailController,
                    obscureText: false,
                    autoFocus: true,
                    onTab: () {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        //check is not write email
                        return 'Email is required';
                      }
                      //check is not email
                      if (!GetUtils.isEmail(value)) {
                        return 'Email is invalid!';
                      }
                      return null;
                    },
                  ),
                  kSizedBox20,
                  TextFormFieldReusableWidget(
                    lableText: "Password",
                    hintText: "Password",
                    controller: passwordController,
                    obscureText: true,
                    autoFocus: true,
                    onTab: () {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password required';
                      }
                      return null;
                    },
                  ),
                  kSizedBox20,
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: kElevateButtonStyle,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('login');
                              }
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Login"),
                                SizedBox(width: 5),
                                Icon(Icons.login),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  kSizedBox15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: const Text("Sign Up", style: kBodyTextStyle),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
