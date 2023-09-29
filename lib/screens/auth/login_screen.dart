import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/components/textformfield_reusable_widget.dart';
import 'package:twitter_clone/controllers/auth_controller.dart';
import 'package:twitter_clone/screens/auth/register_screen.dart';

import '../../constants/constant.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController(text: 'mario@gmail.com');
  final passwordController = TextEditingController(text: '123123');
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(AuthController());

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
                    prefixIcon: Icons.email,
                    controller: emailController,
                    obscureText: false,
                    // autoFocus: true,
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
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return TextFormFieldReusableWidget(
                        lableText: "Password",
                        hintText: "Password",
                        prefixIcon: Icons.lock,
                        controller: passwordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _controller.toggle();
                          },
                          icon: Icon(
                            _controller.hintIcon == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        obscureText: _controller.hintIcon,
                        // autoFocus: true,
                        onTab: () {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password required';
                          }
                          return null;
                        },
                      );
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
                                _controller.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
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
