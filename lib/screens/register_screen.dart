import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/textformfield_reusable_widget.dart';
import '../constants/constant.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final nameController = TextEditingController();
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
                  kSizedBox15,
                  const Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        child: Text("Photo"),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Icon(
                          Icons.camera_alt,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  kSizedBox20,
                  TextFormFieldReusableWidget(
                    lableText: "Name",
                    hintText: "Name",
                    controller: nameController,
                    obscureText: false,
                    autoFocus: true,
                    onTab: () {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        //check is not write email
                        return 'Name is required';
                      }
                      return null;
                    },
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
                                print('register');
                              }
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Register"),
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
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "Login",
                          style: kBodyTextStyle,
                        ),
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
