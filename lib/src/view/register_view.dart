import 'package:absen_app/src/helper/firebase_helper.dart';
import 'package:absen_app/src/widget/custom_layout.dart';
import 'package:absen_app/src/widget/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    super.key,
  });

  static const routeName = '/register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: CustomLayout(
          body: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      Column(
                        textDirection: TextDirection.ltr,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Register',
                            style: TextStyle(
                              color: Color.fromRGBO(13, 71, 161, 1),
                              fontSize: 25,
                              fontFamily: 'Poppins-bold',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextInput(
                            title: "Email",
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Fill The Field";
                              } else if (!EmailValidator.validate(value)) {
                                return "Email is not valid";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordTextInput(
                            title: "Password",
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Fill The Field";
                              } else if (value.length < 6) {
                                return "Password is too short";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordTextInput(
                            title: "Confirm Password",
                            controller: _confirmPasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Fill The Field";
                              } else if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                return "Password does not match";
                              } else if (value.length < 6) {
                                return "Password is too short";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              final result = await FirebaseHelper().register(
                                _emailController.text,
                                _passwordController.text,
                              );

                              if (result == "success") {
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.pop(context);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(result),
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(13, 71, 161, 1),
                          ),
                          child: isLoading
                              ? const LinearProgressIndicator()
                              : const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Poppins-bold',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
